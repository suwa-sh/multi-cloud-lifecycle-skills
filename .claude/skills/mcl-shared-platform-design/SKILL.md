---
name: mcl-shared-platform-design
description: |
  共有プラットフォーム設計用スキル。AWS / Azure / GCP を対象に、ベンダー中立の canonical model、ベンダー別マッピング、サービスカタログ、実装仕様、IaC スケルトンを生成する。共有ランタイム（Kubernetes）、オブザーバビリティ、CI/CD デリバリーパイプライン、アーティファクト管理、シークレット/証明書管理、プラットフォーム所有モデル、テナントオンボーディングをカバーする。共有プラットフォームレイヤー、内部開発者プラットフォーム、プラットフォームエンジニアリング、共有サービスカタログ、共通インフラサービスの設計やレビューに使用すること。1 クラウドのみの言及でも発動する。EKS/AKS/GKE 共有クラスタ、集中監視、共有 CI/CD、プラットフォームチームの責務に関するトピックでもトリガーする。
---

# mcl-shared-platform-design

## このスキルの役割

基盤と個別プロダクトの間に位置する共有プラットフォームレイヤーを設計するスキル。基盤の制約とプラットフォーム要件を入力として、canonical model、vendor mapping、サービスカタログ、実装仕様、IaC スケルトンの一式を生成する。

共有プラットフォームは複数のプロダクトチームが利用する共通サービスを提供する。基盤のガードレールに準拠しつつ、プロダクトチームの開発速度を支える。

## 前提条件

`mcl-foundation-design` の foundation context が必要。`specs/foundation/output/foundation-context.yaml` を確認する。存在しない場合は、先に foundation 設計を実行するようユーザーに案内する。

## アーキテクチャ概要

foundation と同じ 4 層モデル:

1. **Vendor Sources** — EKS/AKS/GKE ドキュメント、監視サービス、CI/CD ツール
2. **Canonical Model** — ベンダー中立なプラットフォーム capability
3. **Vendor Mapping** — クラウドごとのサービス選定
4. **Implementation Artifacts** — 実装仕様、カタログ、IaC スケルトン

## Canonical Model のスコープ

- **shared_runtime** — コンテナオーケストレーション、サーバーレスプラットフォーム、コンピュートオプション
- **shared_observability** — メトリクス、ログ、トレース、ダッシュボード、アラート
- **shared_delivery_pipeline** — CI/CD、GitOps、デプロイ戦略、環境管理
- **shared_artifact_management** — コンテナレジストリ、アーティファクトリポジトリ、依存性プロキシ
- **shared_secret_management** — シークレットストア、証明書ライフサイクル、鍵ローテーション
- **platform_ownership_model** — チーム構成、責務、SLA、エスカレーション
- **onboarding_model** — テナントプロビジョニング、セルフサービス、テナント向けガードレール

## ベンダー別マッピング対象

| Canonical 概念 | AWS | Azure | GCP |
| --- | --- | --- | --- |
| shared_runtime | EKS, ECS, Lambda | AKS, Container Apps, Functions | GKE, Cloud Run, Cloud Functions |
| shared_observability | CloudWatch, X-Ray, Managed Grafana | Azure Monitor, App Insights | Cloud Operations, Cloud Trace |
| shared_delivery_pipeline | CodePipeline, CodeBuild | Azure DevOps, GitHub Actions | Cloud Build, Cloud Deploy |
| shared_artifact_management | ECR, CodeArtifact | ACR, Azure Artifacts | Artifact Registry |
| shared_secret_management | Secrets Manager, ACM | Key Vault, App Configuration | Secret Manager, Certificate Manager |

## ワークフロー

### Step 1: Foundation Context の読み込み

`specs/foundation/output/foundation-context.yaml` を読み込み、以下を把握する:
- 組織構造と境界
- ID、ネットワーク、ポリシー、ログのガードレール
- 課金境界
- 承認済み逸脱

すべての shared platform 設計はこれらの制約に準拠すること。

### Step 2: プラットフォーム入力の収集

`specs/shared-platform/input/` に入力ファイルがあればそこから取得する。無い場合は以下の項目を段階的にヒアリングする。各項目は必ず選択肢を提示し、ユーザーに選んでもらうこと（`../mcl-common/SKILL.md` のユーザーヒアリングポリシー参照）。

#### ヒアリング 1: ランタイムと CI/CD

**Q1. 共有ランタイム**

| # | 選択肢 |
| --- | --- |
| 1 | Kubernetes（EKS/AKS/GKE）★推奨 |
| 2 | コンテナ PaaS（ECS/Container Apps/Cloud Run） |
| 3 | サーバーレス中心（Lambda/Functions/Cloud Functions） |
| 4 | Kubernetes + サーバーレスのハイブリッド |

**Q2. CI/CD パイプライン**

| # | 選択肢 |
| --- | --- |
| 1 | GitHub Actions ★推奨 |
| 2 | GitLab CI/CD |
| 3 | クラウドネイティブ CI/CD（CodePipeline/Azure DevOps/Cloud Build） |
| 4 | Jenkins |
| 5 | その他（ツール名を入力してください） |

**Q3. CD/デプロイ戦略**

| # | 選択肢 |
| --- | --- |
| 1 | ArgoCD（GitOps）★推奨（K8s 選択時） |
| 2 | Flux（GitOps） |
| 3 | CI ツール内蔵のデプロイ |
| 4 | Spinnaker |

#### ヒアリング 2: オブザーバビリティとシークレット管理

**Q4. 統合監視スタック**

| # | 選択肢 |
| --- | --- |
| 1 | Prometheus + Grafana（マネージド）★推奨 |
| 2 | Datadog |
| 3 | クラウドネイティブ（CloudWatch/Azure Monitor/Cloud Operations） |
| 4 | Prometheus + Grafana（セルフホスト） |
| 5 | その他（ツール名を入力してください） |

**Q5. シークレット管理**

| # | 選択肢 |
| --- | --- |
| 1 | クラウドネイティブ + External Secrets Operator ★推奨 |
| 2 | HashiCorp Vault |
| 3 | クラウドネイティブのみ（Secrets Manager/Key Vault/Secret Manager） |
| 4 | Sealed Secrets（K8s ネイティブ） |

#### ヒアリング 3: テナントモデル

**Q6. テナント分離モデル**

| # | 選択肢 |
| --- | --- |
| 1 | Namespace 分離（1 クラスタ内で BU/チームごとに Namespace）★推奨 |
| 2 | クラスタ分離（BU/チームごとに専用クラスタ） |
| 3 | vCluster（仮想クラスタ） |

**Q7. サービス提供方針**（複数選択可）

| # | 選択肢 |
| --- | --- |
| 1 | ランタイム・監視・CI/CD を必須、その他は任意 ★推奨 |
| 2 | 全サービス必須 |
| 3 | 全サービス任意（利用は推奨） |
| 4 | 個別にカスタマイズ（サービスごとに必須/任意を指定してください） |

### Step 3: ベンダーソースの取得（必須）

ベンダーソースは設計判断の根拠となるため、canonical model 生成前に必ず取得すること。ソースが手元にない状態で設計を進めてはならない。

1. `docs/cloud-context/sources/{vendor}/` に対象レイヤーのソースファイルが存在するか確認する
2. **存在しない場合**: バンドルスクリプト `../mcl-common/scripts/fetch-vendor-sources.sh` を実行してベンダーソースをダウンロードする。対象クラウドごとに実行する:
   ```bash
   ../mcl-common/scripts/fetch-vendor-sources.sh <project-dir> --vendor aws --layer shared-platform
   ../mcl-common/scripts/fetch-vendor-sources.sh <project-dir> --vendor azure --layer shared-platform
   ```
   スクリプトは `../mcl-common/scripts/sources.tsv` に定義された URL から公式ドキュメントを取得し、`docs/cloud-context/sources/{vendor}/` に markdown として保存する。対象クラウドあたり最低 1 つのソースが取得できていなければ設計を開始しない。
3. **存在する場合**: そのまま読み込む。`docs/cloud-context/summaries/shared-platform/` にサマリーがあればサマリーも併用する
4. 取得したソースを読み込み、shared-platform レイヤーに関連するガイダンスを把握した上で次の Step に進む

WebFetch に失敗した場合はリトライし、それでも失敗する URL はスキップしてユーザーに通知する。ただし、対象クラウドあたり最低 1 つのソースは取得できていなければ設計を開始しない。

### Step 4: Canonical Model の生成

`../mcl-common/templates/canonical-model.yaml` を使用し、7 つの capability 領域すべてをカバーする canonical model を作成する。全要素が foundation ガードレールに準拠していることを確認する。

保存先: `specs/shared-platform/output/shared-platform-canonical.yaml`

### Step 5: サービスカタログの生成

プラットフォームサービスの一覧を YAML で生成する。各サービスに以下を含める:
- サービス名と説明
- 必須/任意の分類
- 対応ティア（該当する場合）
- 利用モデル（セルフサービス、申請ベース、自動）
- 他プラットフォームサービスへの依存

保存先: `specs/shared-platform/output/service-catalog.yaml`

### Step 6: Vendor Mapping の生成

対象クラウドごとに canonical 要素をベンダーサービスにマッピングする。fidelity 評価と競合解決は foundation と同じルールに従う。

保存先: `specs/shared-platform/output/shared-platform-mapping-{vendor}.yaml`

### Step 7: Decision Record の生成

保存先: `docs/cloud-context/decisions/shared-platform/`

### Step 8: Implementation Spec の生成

保存先: `specs/shared-platform/output/shared-platform-impl-{vendor}.yaml`

### Step 9: Shared Platform Context の生成

下位の product スキルが利用する context YAML を生成する。以下を含める:

- `available_shared_services`
- `mandatory_services`
- `optional_services`
- `runtime_options`
- `observability_standards`
- `delivery_standards`
- `secrets_and_cert_standards`
- `platform_operating_constraints`

保存先: `specs/shared-platform/output/shared-platform-context.yaml`

### Step 10: Conformance Report の生成

shared platform の canonical model と foundation context の両方に対して検証する。

保存先: `docs/cloud-context/conformance/shared-platform/`

### Step 11: IaC スケルトンの生成

保存先: `infra/shared-platform/{vendor}/`

### Step 12: ターゲットアーキテクチャ Markdown の生成

共有プラットフォーム設計を要約した可読性の高いアーキテクチャドキュメントを生成する。図解には Mermaid 記法を使用すること（`../mcl-common/SKILL.md` の図解ポリシー参照）。以下の図を含める:

- **プラットフォーム全体構成図**: `graph TD` で共有サービス間の依存関係とテナント分離をサブグラフで表現
- **CI/CD パイプラインフロー図**: `graph LR` でソースコードからデプロイまでの流れを表現
- **オブザーバビリティスタック図**: `graph TD` でメトリクス・ログ・トレースの収集経路を表現
- **クラウド別デプロイメント図**: `graph TD` で AWS / Azure をサブグラフに分け、各サービスのマッピングを表現

保存先: `docs/cloud-context/generated-md/shared-platform/`

## 出力一覧

| Artifact | パス | 形式 |
| --- | --- | --- |
| Canonical Model | `specs/shared-platform/output/shared-platform-canonical.yaml` | YAML |
| サービスカタログ | `specs/shared-platform/output/service-catalog.yaml` | YAML |
| Vendor Mapping（クラウドごと） | `specs/shared-platform/output/shared-platform-mapping-{vendor}.yaml` | YAML |
| Decision Record | `docs/cloud-context/decisions/shared-platform/` | YAML |
| Implementation Spec（クラウドごと） | `specs/shared-platform/output/shared-platform-impl-{vendor}.yaml` | YAML |
| Shared Platform Context | `specs/shared-platform/output/shared-platform-context.yaml` | YAML |
| Conformance Report（クラウドごと） | `docs/cloud-context/conformance/shared-platform/` | YAML |
| IaC スケルトン（クラウドごと） | `infra/shared-platform/{vendor}/` | HCL/Bicep 等 |
| ターゲットアーキテクチャ | `docs/cloud-context/generated-md/shared-platform/` | Markdown |

## 重要な制約

- Foundation context は必須の前提条件。省略しない
- ファイル生成のみ行う。apply や commit はユーザーが実行する
- YAML が正本。Markdown は派生生成物
- 共通メタデータフィールドを必ず含める
- `../mcl-common/templates/` のテンプレートを使用する
- `../mcl-common/references/` のルールに従う

## リファレンス

foundation と同じリファレンスファイルを使用する。必要に応じて `../mcl-common/references/` から参照する。
