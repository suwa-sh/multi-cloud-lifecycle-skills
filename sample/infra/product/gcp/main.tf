# ==============================================================================
# GCP プロダクトレイヤー — BigQuery データ分析基盤
# ==============================================================================

terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.0"
    }
  }

  # TODO: バックエンド設定を追加すること（例: GCS バケット）
  # backend "gcs" {
  #   bucket = "your-tfstate-bucket"
  #   prefix = "product/bigquery"
  # }
}

provider "google" {
  project = var.project_id # TODO: BigQuery 用プロジェクト ID に変更すること
  region  = "asia-northeast1"
}

provider "google-beta" {
  project = var.project_id # TODO: BigQuery 用プロジェクト ID に変更すること
  region  = "asia-northeast1"
}

# ------------------------------------------------------------------------------
# モジュール呼び出し
# ------------------------------------------------------------------------------

# BigQuery データセット群（raw / staging / intermediate / mart）
module "bigquery_datasets" {
  source = "./modules/bigquery-datasets"

  project_id  = var.project_id
  environment = var.environment
  location    = var.location
  bu_list     = var.bu_list
}

# データ取り込み（AWS リレー / 広告プラットフォーム / SaaS 連携）
module "data_ingestion" {
  source = "./modules/data-ingestion"

  project_id            = var.project_id
  environment           = var.environment
  location              = var.location
  aws_relay_bucket_name = var.aws_relay_bucket_name
  ga4_property_id       = var.ga4_property_id

  # TODO: BigQuery データセット ID をモジュール出力から取得する
  raw_dataset_id = module.bigquery_datasets.raw_dataset_id
}

# dbt スケジューラー（日次変換パイプライン）
module "dbt_scheduler" {
  source = "./modules/dbt-scheduler"

  project_id         = var.project_id
  environment        = var.environment
  location           = var.location
  dbt_schedule_cron  = var.dbt_schedule_cron

  # TODO: BigQuery データセット ID をモジュール出力から取得する
  staging_dataset_id      = module.bigquery_datasets.staging_dataset_id
  intermediate_dataset_id = module.bigquery_datasets.intermediate_dataset_id
  mart_dataset_id         = module.bigquery_datasets.mart_dataset_id
}

# データセキュリティ（PII 分類 / ポリシータグ / マスキング）
module "data_security" {
  source = "./modules/data-security"

  project_id  = var.project_id
  environment = var.environment
  location    = var.location
}
