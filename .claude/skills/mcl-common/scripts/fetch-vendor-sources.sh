#!/usr/bin/env bash
set -euo pipefail

# ベンダーソース収集スクリプト
# 公式ドキュメントを markdown としてダウンロードし、docs/cloud-context/sources/ に保存する。
#
# 前提条件: pandoc が必要（brew install pandoc）
#
# Usage:
#   ./scripts/fetch-vendor-sources.sh <project-dir> [--vendor aws|azure|gcp] [--layer foundation|shared-platform|product] [--force]
#
# Examples:
#   ./scripts/fetch-vendor-sources.sh /path/to/project                        # 全ベンダー・全レイヤー
#   ./scripts/fetch-vendor-sources.sh /path/to/project --vendor aws           # AWS のみ
#   ./scripts/fetch-vendor-sources.sh /path/to/project --layer foundation     # foundation レイヤーのみ
#   ./scripts/fetch-vendor-sources.sh /path/to/project --vendor aws --layer foundation
#   ./scripts/fetch-vendor-sources.sh /path/to/project --force                # 既存ファイルも再取得

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCES_TSV="${SCRIPT_DIR}/sources.tsv"
FETCHED_AT="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

# 最小コンテンツサイズ（これ以下は取得失敗とみなす）
MIN_CONTENT_BYTES=1000

# --- 引数パース ---
if [ $# -lt 1 ]; then
  echo "Usage: $0 <project-dir> [--vendor aws|azure|gcp] [--layer foundation|shared-platform|product] [--force]" >&2
  exit 1
fi

PROJECT_DIR="$1"
shift

FILTER_VENDOR=""
FILTER_LAYER=""
FORCE=false

while [ $# -gt 0 ]; do
  case "$1" in
    --vendor)
      FILTER_VENDOR="$2"
      shift 2
      ;;
    --layer)
      FILTER_LAYER="$2"
      shift 2
      ;;
    --force)
      FORCE=true
      shift
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

# --- 前提条件チェック ---
if ! command -v pandoc &>/dev/null; then
  echo "ERROR: pandoc が見つかりません。インストールしてください: brew install pandoc" >&2
  exit 1
fi

if [ ! -f "${SOURCES_TSV}" ]; then
  echo "ERROR: ${SOURCES_TSV} が見つかりません" >&2
  exit 1
fi

# --- HTML → Markdown 変換 ---
convert_to_md() {
  local html_file="$1"
  # <main> タグ内を抽出（本文のみ取得）。なければ <body> 内、それもなければ全体
  local content
  if grep -q '<main' "$html_file"; then
    content=$(sed -n '/<main/,/<\/main>/p' "$html_file")
  elif grep -q '<body' "$html_file"; then
    content=$(sed -n '/<body/,/<\/body>/p' "$html_file")
  else
    content=$(cat "$html_file")
  fi

  # script, style, nav, header, footer タグを除去してから pandoc で変換
  echo "$content" \
    | sed -E '/<script[^>]*>/,/<\/script>/d' \
    | sed -E '/<style[^>]*>/,/<\/style>/d' \
    | sed -E '/<nav[^>]*>/,/<\/nav>/d' \
    | sed -E '/<header[^>]*>/,/<\/header>/d' \
    | sed -E '/<footer[^>]*>/,/<\/footer>/d' \
    | pandoc -f html -t markdown --wrap=none 2>/dev/null
}

# --- JS リダイレクト検出 ---
is_js_redirect() {
  local html_file="$1"
  # ファイルが小さく、self.location.replace や window.location が含まれていれば JS リダイレクト
  local size
  size=$(wc -c < "$html_file" | tr -d ' ')
  if [ "$size" -lt 2000 ]; then
    if grep -qE 'self\.location\.replace|window\.location|document\.location' "$html_file" 2>/dev/null; then
      return 0
    fi
  fi
  return 1
}

# --- JS リダイレクトの解決 ---
resolve_redirect() {
  local html_file="$1"
  local base_url="$2"
  # リダイレクト先のファイル名を抽出
  local target
  target=$(grep -oE 'myDefaultPage\s*=\s*"[^"]+"' "$html_file" | head -1 | sed 's/.*"\([^"]*\)".*/\1/')
  if [ -z "$target" ]; then
    target=$(grep -oE '(self|window|document)\.location\.(replace|href)\s*[=(]\s*"[^"]+"' "$html_file" | head -1 | sed 's/.*"\([^"]*\)".*/\1/')
  fi
  if [ -n "$target" ]; then
    # ベース URL からリダイレクト先の完全 URL を構築
    local base_dir
    base_dir=$(echo "$base_url" | sed 's|/[^/]*$|/|')
    echo "${base_dir}${target}"
  fi
}

# --- メイン処理 ---
total=0
success=0
skipped=0
failed=0

# ヘッダー行をスキップして TSV を読む
tail -n +2 "${SOURCES_TSV}" | while IFS=$'\t' read -r vendor layer name url; do
  # フィルター適用
  if [ -n "${FILTER_VENDOR}" ] && [ "${vendor}" != "${FILTER_VENDOR}" ]; then
    continue
  fi
  if [ -n "${FILTER_LAYER}" ] && [ "${layer}" != "${FILTER_LAYER}" ]; then
    continue
  fi

  total=$((total + 1))
  output_dir="${PROJECT_DIR}/docs/cloud-context/sources/${vendor}"
  output_file="${output_dir}/${name}.md"

  # 既存ファイルチェック
  if [ -f "${output_file}" ] && [ "${FORCE}" = false ]; then
    echo "SKIP: ${vendor}/${name}.md (already exists)"
    skipped=$((skipped + 1))
    continue
  fi

  mkdir -p "${output_dir}"

  echo -n "FETCH: ${vendor}/${name} ... "

  # ダウンロード（リトライ付き）
  tmp_html="$(mktemp)"
  fetch_url="${url}"
  fetched=false

  for attempt in 1 2 3; do
    if curl -sL --max-time 60 -A "Mozilla/5.0 (compatible; mcl-skills/1.0)" -o "${tmp_html}" "${fetch_url}" 2>/dev/null; then
      if [ -s "${tmp_html}" ]; then
        # JS リダイレクト検出・解決
        if is_js_redirect "${tmp_html}"; then
          resolved_url=$(resolve_redirect "${tmp_html}" "${fetch_url}")
          if [ -n "${resolved_url}" ]; then
            echo -n "(redirect → ${resolved_url##*/}) "
            fetch_url="${resolved_url}"
            continue  # リダイレクト先を取得しなおす
          fi
        fi
        fetched=true
        break
      fi
    fi
    echo -n "(retry ${attempt}) "
    sleep 2
  done

  if [ "${fetched}" = false ]; then
    echo "FAILED (download)"
    rm -f "${tmp_html}"
    failed=$((failed + 1))
    continue
  fi

  # Markdown 変換
  md_content=$(convert_to_md "${tmp_html}")
  rm -f "${tmp_html}"

  # コンテンツサイズチェック
  md_size=${#md_content}
  if [ "${md_size}" -lt "${MIN_CONTENT_BYTES}" ]; then
    echo "FAILED (content too small: ${md_size} bytes, min: ${MIN_CONTENT_BYTES})"
    failed=$((failed + 1))
    continue
  fi

  # メタデータヘッダ付きで保存
  {
    echo "---"
    echo "source_url: \"${fetch_url}\""
    echo "fetched_at: \"${FETCHED_AT}\""
    echo "vendor: \"${vendor}\""
    echo "layer: \"${layer}\""
    echo "---"
    echo ""
    echo "${md_content}"
  } > "${output_file}"

  file_size=$(wc -c < "${output_file}" | tr -d ' ')
  success=$((success + 1))
  echo "OK (${file_size} bytes)"
done

echo ""
echo "Done. success=${success}, skipped=${skipped}, failed=${failed}"

if [ "${failed}" -gt 0 ]; then
  echo ""
  echo "WARN: ${failed} 件の取得に失敗しました。URL が変更されている可能性があります。"
  echo "      sources.tsv の該当 URL を確認してください。"
fi
