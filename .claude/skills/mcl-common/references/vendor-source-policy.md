# ベンダーソースポリシー

## 概要
ベンダーソースドキュメントは全クラウド設計判断の source of truth である。公式ベンダーガイダンスページの markdown export として保存する。

## 保存場所
- ベンダーソースは利用プロジェクトのリポジトリに保存する（本スキルリポジトリではない）
- プライベートリポジトリを使用する
- パス: `docs/cloud-context/sources/{aws,azure,gcp}/`

## 粒度
- 原本はページ単位の markdown ファイル
- 派生 artifact（サマリー、構造化抽出）は必要に応じて作成する

## 更新方針
- デフォルト: リポジトリ上の snapshot から読む
- ソースが存在しない場合は Web から最新を収集する（後述の収集フローを参照）
- ソースのリフレッシュが必要な場合は更新フローを別途実行する
- 生成 artifact には常に snapshot 日付を記載する

## 派生 Artifact
- `source_summary` YAML: 主要ガイダンスの要約版
- `structured_extract` YAML: 特定のガイダンス領域の機械可読な抽出

## 設計意図
- Web への繰り返しアクセスなしに下流処理を高速化する
- ソース更新時の差分検出をサポートする
- 再現性のために安定した参照断面を維持する

---

## 収集対象ソース

### AWS

| レイヤー | ガイダンス | URL |
| --- | --- | --- |
| foundation | AWS Organizations ベストプラクティス | https://docs.aws.amazon.com/organizations/latest/userguide/orgs_best-practices.html |
| foundation | AWS Control Tower ガイダンス | https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html |
| foundation | AWS Security Reference Architecture | https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/welcome.html |
| foundation | AWS IAM Identity Center | https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html |
| foundation | AWS CloudTrail ベストプラクティス | https://docs.aws.amazon.com/awscloudtrail/latest/userguide/best-practices-security.html |
| foundation | AWS Cost Management | https://docs.aws.amazon.com/cost-management/latest/userguide/what-is-costmanagement.html |
| shared-platform | Amazon EKS ベストプラクティス | https://aws.github.io/aws-eks-best-practices/ |
| shared-platform | Amazon Managed Grafana | https://docs.aws.amazon.com/grafana/latest/userguide/what-is-Amazon-Managed-Service-Grafana.html |
| shared-platform | Amazon Managed Prometheus | https://docs.aws.amazon.com/prometheus/latest/userguide/what-is-Amazon-Managed-Service-Prometheus.html |
| shared-platform | AWS Secrets Manager ベストプラクティス | https://docs.aws.amazon.com/secretsmanager/latest/userguide/best-practices.html |
| product | AWS Well-Architected Framework | https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html |
| product | Amazon RDS for PostgreSQL | https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html |
| product | Amazon ElastiCache for Redis | https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/WhatIs.html |

### Azure

| レイヤー | ガイダンス | URL |
| --- | --- | --- |
| foundation | Azure Landing Zone アーキテクチャ | https://learn.microsoft.com/ja-jp/azure/cloud-adoption-framework/ready/landing-zone/ |
| foundation | Azure Management Groups | https://learn.microsoft.com/ja-jp/azure/governance/management-groups/overview |
| foundation | Azure Policy 概要 | https://learn.microsoft.com/ja-jp/azure/governance/policy/overview |
| foundation | Microsoft Entra ID | https://learn.microsoft.com/ja-jp/entra/identity/  |
| foundation | Azure Monitor ログ | https://learn.microsoft.com/ja-jp/azure/azure-monitor/logs/data-platform-logs |
| foundation | Azure Cost Management | https://learn.microsoft.com/ja-jp/azure/cost-management-billing/costs/overview-cost-management |
| shared-platform | AKS ベストプラクティス | https://learn.microsoft.com/ja-jp/azure/aks/best-practices |
| shared-platform | Azure Managed Grafana | https://learn.microsoft.com/ja-jp/azure/managed-grafana/overview |
| shared-platform | Azure Key Vault ベストプラクティス | https://learn.microsoft.com/ja-jp/azure/key-vault/general/best-practices |
| product | Azure Well-Architected Framework | https://learn.microsoft.com/ja-jp/azure/well-architected/ |
| product | Azure Database for PostgreSQL | https://learn.microsoft.com/ja-jp/azure/postgresql/flexible-server/overview |
| product | Azure Cache for Redis | https://learn.microsoft.com/ja-jp/azure/azure-cache-for-redis/cache-overview |

### GCP

| レイヤー | ガイダンス | URL |
| --- | --- | --- |
| foundation | GCP ランディングゾーン設計 | https://cloud.google.com/architecture/landing-zones?hl=ja |
| foundation | GCP リソース階層 | https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy?hl=ja |
| foundation | GCP 組織ポリシー | https://cloud.google.com/resource-manager/docs/organization-policy/overview?hl=ja |
| foundation | Cloud Identity | https://cloud.google.com/identity/docs/overview?hl=ja |
| foundation | Cloud Audit Logs | https://cloud.google.com/logging/docs/audit?hl=ja |
| foundation | Cloud Billing | https://cloud.google.com/billing/docs/concepts?hl=ja |
| shared-platform | GKE ベストプラクティス | https://cloud.google.com/kubernetes-engine/docs/best-practices?hl=ja |
| shared-platform | Cloud Monitoring 概要 | https://cloud.google.com/monitoring/docs/monitoring-overview?hl=ja |
| shared-platform | Secret Manager ベストプラクティス | https://cloud.google.com/secret-manager/docs/best-practices?hl=ja |
| product | GCP Architecture Framework | https://cloud.google.com/architecture/framework?hl=ja |
| product | Cloud SQL for PostgreSQL | https://cloud.google.com/sql/docs/postgres/concepts?hl=ja |
| product | Memorystore for Redis | https://cloud.google.com/memorystore/docs/redis/overview?hl=ja |

---

## 収集フロー

ベンダーソースが `docs/cloud-context/sources/` に存在しない場合、以下の手順で Web から収集する。

### 手順

1. **対象 URL の特定**: 上記テーブルから、設計レイヤーと対象クラウドに合致する URL を抽出する
2. **Web ページの取得**: `WebFetch` ツールで各 URL のコンテンツを取得する
3. **Markdown 変換・保存**: 取得したコンテンツを markdown として整形し、以下のパスに保存する
   - `docs/cloud-context/sources/{vendor}/{ファイル名}.md`
   - ファイル名は URL のパスから導出する（例: `aws-organizations-best-practices.md`）
4. **メタデータヘッダの付与**: 各ファイルの先頭に以下を記載する
   ```markdown
   ---
   source_url: "{元URL}"
   fetched_at: "{取得日時 ISO 8601}"
   vendor: "{aws|azure|gcp}"
   layer: "{foundation|shared-platform|product}"
   ---
   ```
5. **サマリーの生成**（任意）: 収集したソースから `docs/cloud-context/summaries/{layer}/` にレイヤー別サマリーを生成する

### 収集の判断基準

- `docs/cloud-context/sources/{vendor}/` ディレクトリが空またはレイヤーに関連するファイルが無い場合に収集する
- 既存ファイルの `fetched_at` が 90 日以上前の場合、リフレッシュを提案する（自動更新はしない）
- ユーザーが明示的にソースを提示している場合は Web 収集をスキップする

### 注意事項

- 一度の設計実行で全 URL を取得する必要はない。設計レイヤーに関連するソースのみ取得する
- Web 取得に失敗した場合はスキップし、モデルの既存知識で設計を進める。エラーをユーザーに通知する
- 取得したソースは必ずローカルに保存し、以降の実行では保存済みファイルを使う
