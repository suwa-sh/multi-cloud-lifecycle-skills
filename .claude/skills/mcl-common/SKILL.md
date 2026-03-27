---
name: mcl-common
description: |
  mcl-foundation-design / mcl-shared-platform-design / mcl-product-design が共通で参照するメタスキル。共通メタデータスキーマ、YAML テンプレート、正規化・マッピング・競合解決のルールを提供する。このスキルを直接トリガーする必要はない。他の mcl-* スキルが references/ templates/ schemas/ を参照する際に自動的に利用される。mcl-common の内容を確認・編集したい場合や、共通ルールやテンプレートについて質問がある場合にもこのスキルを参照すること。
---

# mcl-common

## 役割

3つの設計スキル（foundation / shared-platform / product）が共通で使うリファレンス、テンプレート、スキーマを集約するメタスキル。各スキルの SKILL.md から参照される。

## バンドルリソース

### references/ — ルール定義

必要な場面で読み込む。常時コンテキストに載せる必要はない。

| ファイル | 内容 | 読むタイミング |
| --- | --- | --- |
| `canonicalization-rules.md` | ベンダー固有の情報をベンダー中立の canonical model に変換するルール | canonical model 生成時 |
| `mapping-rules.md` | canonical model をベンダー固有サービスにマッピングするルール。fidelity レベル（exact/partial/workaround/gap）の定義を含む | vendor mapping 生成時 |
| `conflict-classification.md` | クラウド間の競合を 5 種類に分類し解決するルール（capability/granularity/feature gap/naming/behavioral） | マッピング中に競合が発生した時 |
| `vendor-source-policy.md` | ベンダーソースの保存場所・粒度・更新方針 | ベンダーソース参照・更新時 |
| `implementation-pack-schema.md` | implementation spec / IaC skeleton / conformance report の構造定義 | implementation artifact 生成時 |

### scripts/ — バンドルスクリプト

決定論的な処理を担うスクリプト。各設計スキルから `scripts/` シンボリックリンク経由でアクセスする。

| ファイル | 内容 | 実行タイミング |
| --- | --- | --- |
| `fetch-vendor-sources.sh` | ベンダー公式ドキュメントを markdown としてダウンロードし `docs/cloud-context/sources/{vendor}/` に保存する。`--vendor` と `--layer` でフィルタ可能。リトライ付き、既存ファイルはスキップ | ベンダーソース取得ステップ（各スキルの Step 2/3） |
| `sources.tsv` | 収集対象 URL の定義ファイル（vendor / layer / name / url の TSV）。新しいソースを追加する場合はここに行を追加する | `fetch-vendor-sources.sh` が参照する |

### templates/ — YAML テンプレート

artifact 生成時にベースとして使用する。

| テンプレート | 用途 |
| --- | --- |
| `canonical-model.yaml` | ベンダー中立の capability モデル。elements 配列に要件・制約・依存関係を記述する |
| `vendor-mapping.yaml` | canonical element ごとのベンダーサービスマッピング。fidelity 評価を含む |
| `decision-record.yaml` | 設計判断の記録。conflict type / options / chosen option / rationale / risk を記述する |
| `deviation-record.yaml` | canonical model からの逸脱記録。risk level / mitigation / approval / expiry を記述する |
| `implementation-spec.yaml` | ベンダー固有の実装コンポーネント定義。configuration / validation rules を含む |
| `conformance-report.yaml` | canonical model に対する適合性検証結果。conformant/partial/non_conformant/deferred のステータス |

### schemas/ — スキーマ定義

| ファイル | 内容 |
| --- | --- |
| `common-metadata.yaml` | 全 YAML artifact の必須メタデータフィールド定義。`schema_version`, `artifact_type`, `skill_type`, `artifact_id`, `title`, `status`, `generated_at`, `source_refs`, `decision_refs`, `inputs_ref` |

## 共通メタデータ

全 YAML artifact は以下のフィールドを含むこと:

```yaml
schema_version: "1.0"
artifact_type: ""    # canonical_model | vendor_mapping | decision_record | deviation_record | implementation_spec | conformance_report | context | service_catalog | workload_model | observability_spec | cost_optimization_hints | source_snapshot | source_summary | test_fixture | expected_output
skill_type: ""       # foundation | shared_platform | product
artifact_id: ""      # ^[a-z][a-z0-9-]+$ 形式のユニーク ID
title: ""            # 日本語で記述
status: ""           # draft | review | approved | superseded
generated_at: ""     # ISO 8601 形式
source_refs: []
decision_refs: []
inputs_ref: []
```

## 命名規約

- 識別子は lowercase snake_case（例: `organization_boundary`）
- スコープ接頭辞: `foundation.` / `shared_platform.` / `product.`
- ベンダー製品名ではなく capability 名を使用する

## fidelity レベル

vendor mapping での適合度を 4 段階で評価する:

- **exact** — ベンダーサービスが canonical 要件を直接的に満たす
- **partial** — 大部分をカバーするが不足部分がある（不足内容を記述）
- **workaround** — 直接的な対応がなく、複数サービスの組み合わせが必要
- **gap** — 実現可能なマッピングが存在しない（deviation record が必要）

## 競合タイプ

クラウド間の競合を以下の 5 種類に分類する:

1. **capability** — ベンダー間でアプローチが根本的に異なる
2. **granularity** — サポートする粒度が異なる
3. **feature_gap** — 一部のベンダーに機能が存在しない
4. **naming** — 同じ概念に異なる用語を使用
5. **behavioral** — 同名の機能だがデフォルト動作が異なる

## ユーザーヒアリングポリシー

ユーザーに確認が必要な場合は、必ず選択肢を提示して選んでもらう方式にすること。自由記述のオープンクエスチョンは使わない。

- 各ヒアリング項目に対し、選択肢テーブル（番号付き）を提示する
- 選択肢には「推奨」マークを付けて判断を助ける
- 複数選択が可能な項目はその旨を明記する
- 「その他」が必要な場合は最終選択肢に含める（ユーザーが補足を入力できるようにする）
- 一度に聞く項目は最大 3 つまでにし、段階的にヒアリングする
- `specs/{layer}/input/` に入力ファイルがあればヒアリングをスキップしてその内容を使う

## 出力言語ポリシー

- YAML artifact 内の人間向けテキスト（`title`, `description`, `context`, `rationale`, `comment` 等）は日本語で記述する
- キー名、`artifact_id`、`artifact_type`、`skill_type`、ファイル名、パス名は英語のまま
- 生成 Markdown、IaC コメントも日本語で記述する
