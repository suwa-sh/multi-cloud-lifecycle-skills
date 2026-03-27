# ==============================================================================
# dbt スケジューラーモジュール — 日次変換パイプライン
# ==============================================================================
#
# dbt による日次データ変換パイプラインを Cloud Scheduler + Cloud Run Job で構成する。
# dbt 実行用サービスアカウントに必要な BigQuery IAM を付与する。
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

variable "dbt_schedule_cron" {
  description = "dbt 日次実行の cron スケジュール"
  type        = string
}

variable "staging_dataset_id" {
  description = "staging データセット ID"
  type        = string
}

variable "intermediate_dataset_id" {
  description = "intermediate データセット ID"
  type        = string
}

variable "mart_dataset_id" {
  description = "mart データセット ID（BU 別マップ）"
  type        = map(string)
}

# ------------------------------------------------------------------------------
# ローカル変数
# ------------------------------------------------------------------------------

locals {
  common_labels = {
    cost-center = "data-analytics" # TODO: コストセンター名を設定すること
    environment = var.environment
    service     = "dbt-scheduler"
  }

  # dbt が書き込むデータセットの一覧（staging + intermediate + 全 mart）
  dbt_write_datasets = concat(
    [var.staging_dataset_id, var.intermediate_dataset_id],
    values(var.mart_dataset_id)
  )
}

# ------------------------------------------------------------------------------
# dbt 実行用サービスアカウント
# ------------------------------------------------------------------------------

resource "google_service_account" "dbt_runner" {
  account_id   = "dbt-runner"
  project      = var.project_id
  display_name = "dbt 実行用サービスアカウント"
  description  = "Cloud Scheduler から起動される dbt ジョブの実行 ID。BigQuery データセットへの読み書き権限を持つ。"
}

# ------------------------------------------------------------------------------
# IAM バインディング — BigQuery dataEditor（staging / intermediate / mart）
# ------------------------------------------------------------------------------

# staging データセットへの書き込み権限
resource "google_bigquery_dataset_iam_member" "dbt_staging_editor" {
  project    = var.project_id
  dataset_id = var.staging_dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.dbt_runner.email}"
}

# intermediate データセットへの書き込み権限
resource "google_bigquery_dataset_iam_member" "dbt_intermediate_editor" {
  project    = var.project_id
  dataset_id = var.intermediate_dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.dbt_runner.email}"
}

# mart データセットへの書き込み権限（BU 別）
resource "google_bigquery_dataset_iam_member" "dbt_mart_editor" {
  for_each = var.mart_dataset_id

  project    = var.project_id
  dataset_id = each.value
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.dbt_runner.email}"
}

# ------------------------------------------------------------------------------
# IAM バインディング — BigQuery jobUser（プロジェクトレベル）
# ------------------------------------------------------------------------------

resource "google_project_iam_member" "dbt_job_user" {
  project = var.project_id
  role    = "roles/bigquery.jobUser"
  member  = "serviceAccount:${google_service_account.dbt_runner.email}"
}

# TODO: raw データセットの読み取り権限も必要に応じて付与すること
# resource "google_bigquery_dataset_iam_member" "dbt_raw_reader" {
#   project    = var.project_id
#   dataset_id = "raw"
#   role       = "roles/bigquery.dataViewer"
#   member     = "serviceAccount:${google_service_account.dbt_runner.email}"
# }

# ------------------------------------------------------------------------------
# Cloud Scheduler — dbt 日次実行トリガー
# ------------------------------------------------------------------------------

resource "google_cloud_scheduler_job" "dbt_daily_run" {
  name     = "dbt-daily-run"
  project  = var.project_id
  region   = var.location
  schedule = var.dbt_schedule_cron

  description = "dbt の日次変換パイプラインをトリガーする（raw → staging → intermediate → mart）"

  # TODO: dbt の実行方法を選択し、ターゲットを設定すること
  # 推奨: Cloud Run Job で dbt コンテナを実行
  http_target {
    http_method = "POST"
    uri         = "https://${var.location}-run.googleapis.com/apis/run.googleapis.com/v1/namespaces/${var.project_id}/jobs/dbt-run:run" # TODO: Cloud Run Job のエンドポイントに変更すること

    # dbt 実行用サービスアカウントで認証
    oauth_token {
      service_account_email = google_service_account.dbt_runner.email
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
    }
  }

  # TODO: リトライポリシーを設定すること
  retry_config {
    retry_count          = 1
    max_retry_duration   = "0s" # TODO: リトライ期間を設定すること
    min_backoff_duration = "5s"
    max_backoff_duration = "300s"
  }
}

# ------------------------------------------------------------------------------
# 出力
# ------------------------------------------------------------------------------

output "dbt_runner_service_account_email" {
  description = "dbt 実行用サービスアカウントのメールアドレス"
  value       = google_service_account.dbt_runner.email
}
