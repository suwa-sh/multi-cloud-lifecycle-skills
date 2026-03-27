# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## このリポジトリについて

AWS / Azure / GCP のマルチクラウド基盤設計を支援する Claude Code スキル群（`mcl-*`）。各スキルはベンダー中立の正規モデル、ベンダー別マッピング、実装仕様、IaC スケルトンを生成する。アプリケーションコードではなく、スキル定義・スキーマ・テンプレート・評価フィクスチャで構成される。

## アーキテクチャ: 4層モデル

全スキル共通の処理パイプライン:

```text
Vendor Sources → Canonical Model → Vendor Mapping → Implementation Artifacts
```

優先順位: `source > canonical > mapping > implementation`（競合時は上位層を優先）

## スキル階層とデータフロー

```text
mcl-foundation-design          (最上位 — ガードレールを定義)
    ↓ foundation-context.yaml
mcl-shared-platform-design     (中間 — 共有サービスを定義)
    ↓ shared-platform-context.yaml
mcl-product-design             (最下位 — 個別ワークロードを設計)
```

下位スキルは上位スキルのコンテキスト YAML を必須入力とする。foundation は前提なし、shared-platform は foundation コンテキストが必要、product は両方が必要。

## 主要ディレクトリ

全スキルは `.claude/skills/` 配下に配置:

- `.claude/skills/mcl-common/` — 3スキル共通のメタスキル（直接トリガーされない）
  - `references/` — 正規化ルール、マッピングルール、競合分類、ベンダーソースポリシー
  - `templates/` — canonical model / vendor mapping / decision record / deviation record / implementation spec / conformance report の YAML テンプレート
  - `schemas/` — 共通メタデータスキーマ（全 YAML artifact は `common-metadata.yaml` に準拠必須）
- `.claude/skills/mcl-{foundation,shared-platform,product}-design/` — 各設計スキル
  - `SKILL.md` — スキル定義
  - `evals/` — 評価テストケース
  - `references/`, `templates/`, `schemas/` — `../mcl-common/` へのシンボリックリンク
- `mcl-workspace/` — with_skill / without_skill 比較用の評価ワークスペース（gitignore 対象）

## YAML 正本ポリシー

- YAML が全 artifact の正本。Markdown は常に派生生成物であり、正本にはならない
- 全 YAML artifact は `.claude/skills/mcl-common/schemas/common-metadata.yaml` の共通メタデータを含むこと:
  `schema_version`, `artifact_type`, `skill_type`, `artifact_id`, `title`, `status`, `generated_at`, `source_refs`, `decision_refs`, `inputs_ref`

## 出力先パス規約（利用プロジェクト側）

スキルは利用プロジェクトのディレクトリ構造に出力する:

| カテゴリ | パスパターン |
| --- | --- |
| Canonical/Mapping/Impl 仕様 | `specs/{layer}/output/` |
| Decision Record | `docs/cloud-context/decisions/{layer}/` |
| Conformance Report | `docs/cloud-context/conformance/{layer}/` |
| IaC スケルトン | `infra/{layer}/{vendor}/` |
| 生成ドキュメント | `docs/cloud-context/generated-md/{layer}/` |

`{layer}` は `foundation` / `shared-platform` / `product`、`{vendor}` は `aws` / `azure` / `gcp`。

## テスト戦略

テストはスキル実装側（本リポジトリ）に持ち、利用プロジェクト側には持たない。テストレベル:

- **L1（形式）**: ファイル存在、必須項目存在、スキーマ準拠
- **L2（内容）**: artifact 間の整合性、スキル間インターフェースの整合性
- **L3（差分）**: ベンダーソース更新後の再生成結果が期待どおり変化するか
- **L4（dry-run）**: 生成 IaC が静的検証を通るか

最低完了条件: Tier A（スキーマ検証 + 適合性チェック + 決定性チェック）+ Tier B（IaC 静的検証）

評価定義は `.claude/skills/mcl-{skill}/evals/evals.json`。`mcl-workspace/` に with/without スキル比較の反復出力を格納する。

## 出力言語ポリシー

- YAML artifact 内の人間向けテキスト（`title`, `description`, `context`, `rationale`, `comment` 等）は日本語で記述する
- YAML のキー名、`artifact_id`、`artifact_type`、`skill_type`、ファイル名、パス名は英語のまま
- 生成 Markdown も日本語で記述する
- IaC のコメント（`# TODO:` 等）は日本語で記述する

## 重要な制約

- スキルはファイル生成のみ — apply や commit は行わない（ユーザーが実行する）
- ベンダーソースは利用プロジェクトの `docs/cloud-context/sources/{aws,azure,gcp}/` に markdown export として保存
- AWS / Azure / GCP の 3 クラウドを全て対応する（呼び出し時にサブセット指定可）
- IaC スケルトンのプレースホルダー値には `# TODO:` コメントを付与すること
