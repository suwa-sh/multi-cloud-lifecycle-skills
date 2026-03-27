# ==============================================================================
# データ取り込みモジュール — AWS リレー / 広告プラットフォーム / SaaS 連携
# ==============================================================================
#
# 以下のデータソースからの取り込みパイプラインを構成する:
#   1. AWS S3 → GCS リレーバケット → BigQuery raw
#   2. Google Ads / Facebook Ads → BigQuery Data Transfer Service → raw
#   3. Slack / Sentry → Cloud Functions → raw
#   4. Cloud Scheduler によるロードジョブトリガー
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

variable "aws_relay_bucket_name" {
  description = "AWS リレー用 GCS バケット名"
  type        = string
}

variable "ga4_property_id" {
  description = "GA4 プロパティ ID"
  type        = string
}

variable "raw_dataset_id" {
  description = "BigQuery raw データセット ID"
  type        = string
}

# ------------------------------------------------------------------------------
# ローカル変数
# ------------------------------------------------------------------------------

locals {
  common_labels = {
    cost-center = "data-analytics" # TODO: コストセンター名を設定すること
    environment = var.environment
    service     = "data-ingestion"
  }
}

# ------------------------------------------------------------------------------
# 1. AWS リレー用 GCS バケット（ライフサイクル 30 日）
# ------------------------------------------------------------------------------

resource "google_storage_bucket" "aws_relay" {
  name     = var.aws_relay_bucket_name
  project  = var.project_id
  location = var.location

  # TODO: ストレージクラスを要件に合わせて変更すること
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  # 30 日経過後にオブジェクトを自動削除
  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }

  # TODO: バージョニングの要否を検討すること
  versioning {
    enabled = false
  }

  labels = local.common_labels
}

# TODO: AWS 側の S3 → GCS Storage Transfer Service ジョブを設定すること
# resource "google_storage_transfer_job" "aws_s3_relay" {
#   description = "AWS S3 から GCS へのデータリレー"
#   project     = var.project_id
#   ...
# }

# ------------------------------------------------------------------------------
# 2. BigQuery Data Transfer Service — 広告プラットフォーム
# ------------------------------------------------------------------------------

# Google Ads データ転送
resource "google_bigquery_data_transfer_config" "google_ads" {
  display_name   = "Google Ads データ転送"
  project        = var.project_id
  location       = var.location
  data_source_id = "google_ads" # TODO: 正確なデータソース ID を確認すること

  destination_dataset_id = var.raw_dataset_id

  # TODO: Google Ads の顧客 ID を設定すること
  params = {
    "customer_id" = "000-000-0000" # TODO: Google Ads 顧客 ID に変更すること
  }

  schedule = "every 24 hours"

  # TODO: サービスアカウントのメール設定（認証済みアカウントが必要）
  # service_account_name = "bq-dts@${var.project_id}.iam.gserviceaccount.com"
}

# TODO: Facebook Ads データ転送はサードパーティコネクタで実装すること
# Fivetran / Airbyte 等のマネージド ETL サービスを検討
# resource "google_bigquery_data_transfer_config" "facebook_ads" {
#   display_name   = "Facebook Ads データ転送"
#   data_source_id = "..." # TODO: サードパーティデータソース ID
#   ...
# }

# ------------------------------------------------------------------------------
# 3. Cloud Functions — Slack / Sentry Webhook 取り込み
# ------------------------------------------------------------------------------

# Cloud Functions 用 GCS バケット（ソースコード格納）
resource "google_storage_bucket" "functions_source" {
  name     = "${var.project_id}-functions-source"
  project  = var.project_id
  location = var.location

  uniform_bucket_level_access = true

  labels = local.common_labels
}

# Slack Webhook 取り込み関数
resource "google_cloudfunctions2_function" "slack_ingestion" {
  name     = "slack-ingestion"
  project  = var.project_id
  location = var.location

  description = "Slack Webhook イベントを受信し BigQuery raw データセットにロードする"

  build_config {
    runtime     = "python312" # TODO: ランタイムバージョンを確認すること
    entry_point = "handle_slack_event"

    source {
      storage_source {
        bucket = google_storage_bucket.functions_source.name
        object = "slack-ingestion.zip" # TODO: ソースコードをアップロードすること
      }
    }
  }

  service_config {
    max_instance_count = 10  # TODO: 最大インスタンス数を調整すること
    min_instance_count = 0
    available_memory   = "256M"
    timeout_seconds    = 60

    environment_variables = {
      PROJECT_ID     = var.project_id
      DATASET_ID     = var.raw_dataset_id
      TABLE_ID       = "slack_events" # TODO: テーブル名を確認すること
    }

    # TODO: VPC コネクタを設定すること（プライベートネットワーク要件がある場合）
    # vpc_connector = "projects/${var.project_id}/locations/${var.location}/connectors/serverless-connector"
  }

  labels = local.common_labels
}

# Sentry Webhook 取り込み関数
resource "google_cloudfunctions2_function" "sentry_ingestion" {
  name     = "sentry-ingestion"
  project  = var.project_id
  location = var.location

  description = "Sentry Webhook イベントを受信し BigQuery raw データセットにロードする"

  build_config {
    runtime     = "python312" # TODO: ランタイムバージョンを確認すること
    entry_point = "handle_sentry_event"

    source {
      storage_source {
        bucket = google_storage_bucket.functions_source.name
        object = "sentry-ingestion.zip" # TODO: ソースコードをアップロードすること
      }
    }
  }

  service_config {
    max_instance_count = 10  # TODO: 最大インスタンス数を調整すること
    min_instance_count = 0
    available_memory   = "256M"
    timeout_seconds    = 60

    environment_variables = {
      PROJECT_ID     = var.project_id
      DATASET_ID     = var.raw_dataset_id
      TABLE_ID       = "sentry_events" # TODO: テーブル名を確認すること
    }
  }

  labels = local.common_labels
}

# ------------------------------------------------------------------------------
# 4. Cloud Scheduler — ロードジョブトリガー
# ------------------------------------------------------------------------------

# AWS リレーデータのロードジョブトリガー
resource "google_cloud_scheduler_job" "aws_relay_load" {
  name     = "aws-relay-load-trigger"
  project  = var.project_id
  region   = var.location
  schedule = "0 22 * * *" # TODO: JST 07:00（UTC 22:00）に AWS データリレー完了後に実行

  description = "AWS S3 リレーデータを GCS から BigQuery raw にロードするトリガー"

  # TODO: ロードジョブの実行方法を選択すること（Cloud Functions / Workflows / Cloud Run Job）
  http_target {
    http_method = "POST"
    uri         = "https://${var.location}-${var.project_id}.cloudfunctions.net/aws-relay-loader" # TODO: 実際のエンドポイントに変更すること

    # TODO: 認証設定を追加すること
    # oidc_token {
    #   service_account_email = "scheduler-sa@${var.project_id}.iam.gserviceaccount.com"
    # }
  }
}

# GA4 エクスポート確認ジョブ（GA4 → BigQuery はネイティブ連携だがデータ到着を検知）
resource "google_cloud_scheduler_job" "ga4_check" {
  name     = "ga4-export-check"
  project  = var.project_id
  region   = var.location
  schedule = "30 22 * * *" # TODO: GA4 エクスポート完了後のタイミングに調整すること

  description = "GA4 BigQuery エクスポートのデータ到着を確認し後続処理をトリガーする"

  # TODO: データ到着確認ロジックのエンドポイントを設定すること
  http_target {
    http_method = "POST"
    uri         = "https://${var.location}-${var.project_id}.cloudfunctions.net/ga4-check" # TODO: 実際のエンドポイントに変更すること
  }
}
