# ==============================================================================
# データセキュリティモジュール — PII 分類 / ポリシータグ / マスキング
# ==============================================================================
#
# BigQuery のデータセキュリティを以下の 3 レイヤーで構成する:
#   1. Data Catalog タクソノミー: PII 分類体系の定義
#   2. ポリシータグ: カラムレベルのセキュリティ分類
#   3. データポリシー: マスキングルール（Fine-Grained Reader 制御）
#
# Authorized Views は Terraform 外で BigQuery SQL により構成する（後述）。
#
# ==============================================================================

variable "project_id" {
  description = "GCP プロジェクト ID"
  type        = string
}

variable "environment" {
  description = "環境名"
  type        = string
}

variable "location" {
  description = "リソースロケーション"
  type        = string
}

# ------------------------------------------------------------------------------
# 1. Data Catalog タクソノミー — PII 分類体系
# ------------------------------------------------------------------------------

resource "google_data_catalog_taxonomy" "pii_taxonomy" {
  provider = google-beta

  project      = var.project_id
  region       = var.location
  display_name = "PII 分類タクソノミー"
  description  = "個人情報（PII）のカラムレベル分類体系。BigQuery ポリシータグによるアクセス制御とマスキングに使用する。"

  activated_policy_types = ["FINE_GRAINED_ACCESS_CONTROL"]
}

# ------------------------------------------------------------------------------
# 2. ポリシータグ — PII カラムの分類
# ------------------------------------------------------------------------------

# 高機密 PII（氏名・メールアドレス・電話番号等）
resource "google_data_catalog_policy_tag" "high_sensitivity_pii" {
  provider = google-beta

  taxonomy     = google_data_catalog_taxonomy.pii_taxonomy.id
  display_name = "高機密 PII"
  description  = "氏名、メールアドレス、電話番号、住所等の直接識別可能な個人情報。原則マスキングし、Fine-Grained Reader のみ閲覧可能。"

  # TODO: 子タグを追加して PII 種別を細分化すること（氏名 / メール / 電話番号 / 住所 等）
}

# 中機密 PII（ユーザー ID・IP アドレス等）
resource "google_data_catalog_policy_tag" "medium_sensitivity_pii" {
  provider = google-beta

  taxonomy     = google_data_catalog_taxonomy.pii_taxonomy.id
  display_name = "中機密 PII"
  description  = "ユーザー ID、IP アドレス、デバイス ID 等の間接的に個人を特定可能な情報。条件付きでマスキング。"
}

# 低機密（集計キー等）
resource "google_data_catalog_policy_tag" "low_sensitivity" {
  provider = google-beta

  taxonomy     = google_data_catalog_taxonomy.pii_taxonomy.id
  display_name = "低機密"
  description  = "年齢層、地域（都道府県レベル）等の集計に使用可能な準個人情報。マスキング不要だが分類は付与する。"
}

# ------------------------------------------------------------------------------
# 3. データポリシー — マスキングルール
# ------------------------------------------------------------------------------

# 高機密 PII に対するデフォルトマスキング（SHA256 ハッシュ）
resource "google_bigquery_datapolicy_data_policy" "high_pii_masking" {
  provider = google-beta

  project          = var.project_id
  location         = var.location
  data_policy_id   = "high-pii-masking"
  policy_tag       = google_data_catalog_policy_tag.high_sensitivity_pii.name
  data_policy_type = "DATA_MASKING_POLICY"

  data_masking_policy {
    predefined_expression = "SHA256" # TODO: マスキング方式を要件に合わせて変更すること（SHA256 / ALWAYS_NULL / DEFAULT_MASKING_VALUE）
  }
}

# 中機密 PII に対するマスキング（デフォルト値でマスク）
resource "google_bigquery_datapolicy_data_policy" "medium_pii_masking" {
  provider = google-beta

  project          = var.project_id
  location         = var.location
  data_policy_id   = "medium-pii-masking"
  policy_tag       = google_data_catalog_policy_tag.medium_sensitivity_pii.name
  data_policy_type = "DATA_MASKING_POLICY"

  data_masking_policy {
    predefined_expression = "DEFAULT_MASKING_VALUE" # TODO: マスキング方式を要件に合わせて変更すること
  }
}

# TODO: Fine-Grained Reader IAM を設定すること
# マスキングされたカラムの平文を閲覧できるユーザー/グループを指定する
# resource "google_data_catalog_taxonomy_iam_member" "fine_grained_reader" {
#   provider = google-beta
#   taxonomy = google_data_catalog_taxonomy.pii_taxonomy.name
#   role     = "roles/datacatalog.categoryFineGrainedReader"
#   member   = "group:pii-readers@example.com" # TODO: PII 閲覧許可グループを設定すること
# }

# ------------------------------------------------------------------------------
# Authorized Views によるデータアクセス制御（参考）
# ------------------------------------------------------------------------------
#
# BigQuery Authorized Views は Terraform ではなく SQL で管理する。
# 以下の運用フローを推奨:
#
# 1. mart データセットに Authorized View を作成する:
#    CREATE VIEW mart_sales.v_customer_summary AS
#    SELECT customer_segment, region, COUNT(*) as cnt
#    FROM mart_sales.customer_master
#    GROUP BY customer_segment, region;
#
# 2. Authorized View を mart データセットの ACL に追加する:
#    bq update --view --dataset mart_sales \
#      --authorized_view myproject:mart_sales.v_customer_summary
#
# 3. Authorized View にのみアクセス権を付与し、元テーブルへの直接アクセスは禁止する。
#
# TODO: Authorized Views の管理を dbt の post-hook または別途 Terraform で自動化すること
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# 出力
# ------------------------------------------------------------------------------

output "pii_taxonomy_id" {
  description = "PII 分類タクソノミー ID"
  value       = google_data_catalog_taxonomy.pii_taxonomy.id
}

output "high_pii_policy_tag_id" {
  description = "高機密 PII ポリシータグ ID"
  value       = google_data_catalog_policy_tag.high_sensitivity_pii.id
}

output "medium_pii_policy_tag_id" {
  description = "中機密 PII ポリシータグ ID"
  value       = google_data_catalog_policy_tag.medium_sensitivity_pii.id
}
