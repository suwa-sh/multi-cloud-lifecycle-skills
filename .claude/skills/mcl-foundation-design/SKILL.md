---
name: mcl-foundation-design
description: |
  マルチクラウド基盤（ランディングゾーン）設計用スキル。AWS / Azure / GCP を対象に、ベンダー中立の canonical model、ベンダー別マッピング、実装仕様、IaC スケルトンを生成する。組織構造、ID、ネットワーク、ポリシー、ログ、課金、セキュリティガードレールをカバーする。クラウド基盤設計、ランディングゾーンアーキテクチャ、組織構造、アカウント/サブスクリプション/プロジェクト階層、ID フェデレーション、ネットワーク分離、ポリシー適用、監査/ログ集約、課金境界、セキュリティガードレールに関する要求で使用すること。1 クラウドのみの言及でも発動する。AWS Organizations/SCP、Azure Management Groups/Policy、GCP Org Policy に関する質問も基盤設計の文脈であればトリガーする。
---

# mcl-foundation-design

## このスキルの役割

マルチクラウド環境の基盤レイヤーを設計するスキル。組織要件（構造、セキュリティ、監査、予算、対象クラウド、例外条件）を入力として、ベンダー中立の canonical model からベンダー別マッピング、実装可能な IaC スケルトンまで一式の設計 artifact を生成する。

基盤レイヤーは階層の最上位に位置する。ここでの出力が shared platform と product レイヤーの制約となるため、変更の影響が全体に波及する。

## アーキテクチャ概要

設計は 4 層モデルに従い、順に処理する:

1. **Vendor Sources** — AWS CAF/Landing Zone、Azure CAF/Landing Zone、GCP Architecture Guidance の公式ガイダンス
2. **Canonical Model** — ベンダー中立な基盤 capability の表現
3. **Vendor Mapping** — canonical model を各クラウドに再投影
4. **Implementation Artifacts** — 実装仕様、IaC スケルトン、適合性レポート

優先順位は上から下: `source > canonical > mapping > implementation`。迷ったら上位層に従う。

## Canonical Model のスコープ

foundation の canonical model は以下の 8 つの capability 領域をカバーする:

- **organization_boundary** — アカウント/サブスクリプション/プロジェクトの論理階層と分離モデル
- **billing_boundary** — コスト帰属、予算責任、チャージバック/ショウバックモデル
- **identity_boundary** — ID フェデレーション、特権モデル、ブレークグラス手順
- **policy_enforcement** — 予防的コントロール、ガードレール、許可/拒否サービスリスト
- **network_segmentation** — 接続モデル、トランジットアーキテクチャ、エグレス制御
- **audit_aggregation** — ログ収集、保持期間、改ざん防止、SIEM 連携
- **security_guardrails** — ベースラインセキュリティポスチャ、暗号化デフォルト、鍵管理
- **exception_handling** — 逸脱承認プロセス、期限付き例外、リスク受容

## ベンダー別マッピング対象

| Canonical 概念 | AWS | Azure | GCP |
| --- | --- | --- | --- |
| organization_boundary | Organizations, OUs | Management Groups, Subscriptions | Organizations, Folders |
| billing_boundary | Consolidated Billing, Cost Allocation Tags | Cost Management, Resource Tags | Billing Accounts, Labels |
| identity_boundary | IAM Identity Center, SCP | Entra ID, RBAC, PIM | Cloud Identity, IAM |
| policy_enforcement | SCPs, Config Rules | Azure Policy, Blueprints | Org Policy, Security Command Center |
| network_segmentation | Transit Gateway, VPC | Virtual WAN, VNet | Shared VPC, VPC Service Controls |
| audit_aggregation | CloudTrail, Security Hub | Activity Log, Sentinel | Audit Logs, Chronicle |
| security_guardrails | GuardDuty, Security Hub | Defender for Cloud | Security Command Center |

## ワークフロー

### Step 1: 入力の収集

`specs/foundation/input/` に入力ファイルがあればそこから取得する。無い場合は以下の項目を段階的にヒアリングする。各項目は必ず選択肢を提示し、ユーザーに選んでもらうこと（`../mcl-common/SKILL.md` のユーザーヒアリングポリシー参照）。

#### ヒアリング 1: 組織構造と対象クラウド

**Q1. 対象クラウド**（複数選択可）

| # | 選択肢 |
| --- | --- |
| 1 | AWS のみ |
| 2 | Azure のみ |
| 3 | GCP のみ |
| 4 | AWS + Azure ★推奨（国内企業の典型パターン） |
| 5 | AWS + GCP |
| 6 | Azure + GCP |
| 7 | AWS + Azure + GCP（全対応） |

**Q2. BU（事業部門）の数**

| # | 選択肢 |
| --- | --- |
| 1 | 1 BU（全社一体） |
| 2 | 2〜3 BU ★推奨（BU 名を入力してください） |
| 3 | 4〜6 BU（BU 名を入力してください） |
| 4 | 7 BU 以上（BU 名を入力してください） |

**Q3. 環境構成**

| # | 選択肢 |
| --- | --- |
| 1 | 本番 + 開発（2 面） |
| 2 | 本番 + ステージング + 開発（3 面）★推奨 |
| 3 | 本番 + ステージング + 開発 + サンドボックス（4 面） |
| 4 | その他（構成を入力してください） |

#### ヒアリング 2: セキュリティ・コンプライアンスとログ

**Q4. セキュリティ・コンプライアンス要件**（複数選択可）

| # | 選択肢 |
| --- | --- |
| 1 | SOC2 ★推奨（SaaS 企業の標準） |
| 2 | ISO 27001 |
| 3 | PCI DSS（決済データを扱う場合） |
| 4 | HIPAA（医療情報を扱う場合） |
| 5 | ISMAP（政府系システム） |
| 6 | 特になし（社内ポリシーのみ） |
| 7 | その他（要件を入力してください） |

**Q5. 監査ログの保持期間**

| # | 選択肢 |
| --- | --- |
| 1 | 90 日 |
| 2 | 1 年 ★推奨（SOC2 標準） |
| 3 | 3 年 |
| 4 | 7 年（金融規制対応） |
| 5 | その他（期間を入力してください） |

#### ヒアリング 3: 予算管理と按分ルール

**Q6. 予算責任の境界**

| # | 選択肢 |
| --- | --- |
| 1 | BU 単位 ★推奨 |
| 2 | プロジェクト単位 |
| 3 | 環境単位（本番/開発） |
| 4 | 全社一括 |

**Q7. 共有インフラコストの按分ルール**

共有インフラ（ネットワーク、ID 基盤、ログ基盤、セキュリティサービス等）のコスト配分方法。`billing_boundary` の canonical model とタグ/ラベル設計に直接影響する。

| # | 按分モデル | 計算方法 | 適するケース |
| --- | --- | --- | --- |
| 1 | **均等割** | コスト ÷ BU 数 | BU 間の利用差が小さい、立ち上げ初期 |
| 2 | **利用量比例** | リソース消費量に応じて配分 | 計測基盤が整っている、公平性を重視 |
| 3 | **ヘッドカウント比例** | BU の人数比で按分 | 人数と利用が相関するサービス |
| 4 | **売上/予算比例** | BU の収益比で按分 | 経営層への説明を重視 |
| 5 | **固定＋変動ハイブリッド** | 基盤固定費は均等割、変動費は利用量比例 | ★推奨（最も一般的な実運用パターン） |
| 6 | **直課** | タグで BU に直接紐付け、共有分のみ按分 | 専用リソースが識別できる場合 |

選定のポイント:
- 計測コスト vs 精度のトレードオフを考慮する。利用量比例は公平だが計測・集計の仕組みが必要
- 段階的導入も有効: 初期は均等割 → 計測基盤が整ったら利用量比例に移行
- AWS Cost Categories / Azure Cost Management のコスト配分ルールで自動按分が可能

選定結果は `docs/cloud-context/decisions/foundation/` に decision record として保存する（テンプレート: `../mcl-common/templates/cost-allocation-decision.yaml`）。

### Step 2: ベンダーソースの取得（必須）

ベンダーソースは設計判断の根拠となるため、canonical model 生成前に必ず取得すること。ソースが手元にない状態で設計を進めてはならない。

1. `docs/cloud-context/sources/{vendor}/` に対象レイヤーのソースファイルが存在するか確認する
2. **存在しない場合**: バンドルスクリプト `../mcl-common/scripts/fetch-vendor-sources.sh` を実行してベンダーソースをダウンロードする。対象クラウドごとに実行する:
   ```bash
   ../mcl-common/scripts/fetch-vendor-sources.sh <project-dir> --vendor aws --layer foundation
   ../mcl-common/scripts/fetch-vendor-sources.sh <project-dir> --vendor azure --layer foundation
   ```
   スクリプトは `../mcl-common/scripts/sources.tsv` に定義された URL から公式ドキュメントを取得し、`docs/cloud-context/sources/{vendor}/` に markdown として保存する。対象クラウドあたり最低 1 つのソースが取得できていなければ設計を開始しない。
3. **存在する場合**: そのまま読み込む。`docs/cloud-context/summaries/foundation/` にサマリーがあればサマリーも併用する
4. 取得したソースを読み込み、foundation レイヤーに関連するガイダンスを把握した上で次の Step に進む

### Step 3: Canonical Model の生成

`../mcl-common/templates/canonical-model.yaml` をテンプレートとして使用:

1. 8 つの capability 領域すべてをカバーする foundation canonical model を作成する
2. 要件をベンダー中立の capability として表現する
3. 各要素をソース参照にリンクする
4. `../mcl-common/references/canonicalization-rules.md` の正規化ルールを適用する

保存先: `specs/foundation/output/foundation-canonical.yaml`

### Step 4: Vendor Mapping の生成

対象クラウドごとに `../mcl-common/templates/vendor-mapping.yaml` を使用:

1. canonical の全要素をベンダー固有サービスにマッピングする
2. `../mcl-common/references/mapping-rules.md` に従い fidelity（exact/partial/workaround/gap）を評価する
3. ギャップとワークアラウンドを記述する
4. `../mcl-common/references/conflict-classification.md` に従い競合を解決する

保存先: `specs/foundation/output/foundation-mapping-{vendor}.yaml`

### Step 5: Decision Record の生成

競合や自明でない選択について `../mcl-common/templates/decision-record.yaml` で decision record を作成する。

保存先: `docs/cloud-context/decisions/foundation/`

### Step 6: Implementation Spec の生成

ベンダーごとに `../mcl-common/templates/implementation-spec.yaml` を使用:

1. 実装コンポーネントを詳細化する
2. ベンダー固有の設定を含める
3. 検証ルールを定義する
4. IaC モジュールを参照する

保存先: `specs/foundation/output/foundation-impl-{vendor}.yaml`

### Step 7: Foundation Context の生成

下位スキル（shared-platform, product）が利用する foundation context YAML を生成する。以下を含むキュレーションされたサブセット:

- `organization_structure`
- `identity_guardrails`
- `network_guardrails`
- `policy_guardrails`
- `logging_guardrails`
- `billing_boundaries`
- `approved_deviations`

保存先: `specs/foundation/output/foundation-context.yaml`

### Step 8: Conformance Report の生成

`../mcl-common/templates/conformance-report.yaml` を使用し、各 implementation spec を canonical model に対して検証する。

保存先: `docs/cloud-context/conformance/foundation/`

### Step 9: IaC スケルトンの生成

ベンダーごとに静的検証（Tier B dry-run）に合格する IaC スケルトンを生成する:

- **AWS**: Terraform または CloudFormation
- **Azure**: Terraform または Bicep
- **GCP**: Terraform または Deployment Manager

プレースホルダー値には `# TODO:` コメントを付与する。モジュール構成は canonical model の境界に合わせる。

保存先: `infra/foundation/{vendor}/`

### Step 10: ターゲットアーキテクチャ Markdown の生成

基盤設計を要約した可読性の高いアーキテクチャドキュメントを生成する。図解には Mermaid 記法を使用すること（`../mcl-common/SKILL.md` の図解ポリシー参照）。以下の図を含める:

- **組織階層図**: `graph TD` で BU / 環境 / アカウント構造をサブグラフで表現
- **ネットワークトポロジ図**: `graph LR` で Hub-Spoke / Transit Gateway / VNet 接続を表現
- **セキュリティガードレール図**: `graph TD` でポリシー適用の階層とスコープを表現

保存先: `docs/cloud-context/generated-md/foundation/`

## 出力一覧

| Artifact | パス | 形式 |
| --- | --- | --- |
| Canonical Model | `specs/foundation/output/foundation-canonical.yaml` | YAML |
| Vendor Mapping（クラウドごと） | `specs/foundation/output/foundation-mapping-{vendor}.yaml` | YAML |
| Decision Record | `docs/cloud-context/decisions/foundation/` | YAML |
| Implementation Spec（クラウドごと） | `specs/foundation/output/foundation-impl-{vendor}.yaml` | YAML |
| Foundation Context | `specs/foundation/output/foundation-context.yaml` | YAML |
| Conformance Report（クラウドごと） | `docs/cloud-context/conformance/foundation/` | YAML |
| IaC スケルトン（クラウドごと） | `infra/foundation/{vendor}/` | HCL/Bicep 等 |
| ターゲットアーキテクチャ | `docs/cloud-context/generated-md/foundation/` | Markdown |

## 重要な制約

- ファイル生成のみ行う。apply や commit はユーザーが実行する
- YAML が正本。Markdown は派生生成物
- 共通メタデータフィールドを必ず含める（`../mcl-common/schemas/common-metadata.yaml` 参照）
- `../mcl-common/templates/` のテンプレートをベースにする
- `../mcl-common/references/` のルールに従う

## リファレンス

必要に応じて `../mcl-common/references/` から以下を参照する:
- `vendor-source-policy.md` — ベンダーソースの保存・更新方針
- `canonicalization-rules.md` — ベンダー中立モデルの作成ルール
- `mapping-rules.md` — canonical からベンダー固有へのマッピングルール
- `implementation-pack-schema.md` — implementation artifact の構造
- `conflict-classification.md` — クラウド間競合の分類・解決ルール
