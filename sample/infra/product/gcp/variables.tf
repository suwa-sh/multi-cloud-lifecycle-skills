# ==============================================================================
# GCP プロダクトレイヤー — 入力変数
# ==============================================================================

variable "project_id" {
  description = "BigQuery データ分析基盤用の GCP プロジェクト ID"
  type        = string
  # TODO: プロジェクト ID を設定すること（例: "mycompany-analytics-prod"）
}

variable "environment" {
  description = "デプロイ先の環境名"
  type        = string
  # TODO: 環境名を設定すること（例: "production", "staging", "development"）
}

variable "location" {
  description = "BigQuery データセット・GCS バケットのロケーション"
  type        = string
  default     = "asia-northeast1"
}

variable "aws_relay_bucket_name" {
  description = "AWS からのデータリレー用 GCS バケット名"
  type        = string
  # TODO: GCS バケット名を設定すること（例: "mycompany-aws-relay-prod"）
}

variable "dbt_schedule_cron" {
  description = "dbt 日次実行の cron スケジュール（UTC）"
  type        = string
  # TODO: cron 式を設定すること（JST 06:00 = UTC 21:00）
  default = "0 21 * * *"
}

variable "bu_list" {
  description = "データマートを分割するビジネスユニットのリスト"
  type        = list(string)
  # TODO: ビジネスユニット名を設定すること
  default = ["sales", "marketing", "product"]
}

variable "ga4_property_id" {
  description = "Google Analytics 4 プロパティ ID"
  type        = string
  # TODO: GA4 プロパティ ID を設定すること（例: "123456789"）
}
