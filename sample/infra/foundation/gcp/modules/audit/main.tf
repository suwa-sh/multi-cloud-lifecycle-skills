# ==============================================================================
# 監査ログ — BigQuery データアクセスログ + ログ集約 + 保管
# ==============================================================================

variable "org_prefix" {
  type = string
}

variable "environments" {
  type = list(string)
}

variable "project_ids" {
  type = map(string)
}

variable "folder_id" {
  type = string
}

# ------------------------------------------------------------------------------
# BigQuery データアクセス監査ログの有効化（環境別）
# ------------------------------------------------------------------------------

resource "google_project_iam_audit_config" "bigquery_audit" {
  for_each = var.project_ids

  project = each.value
  service = "bigquery.googleapis.com"

  audit_log_config {
    log_type = "ADMIN_READ"
  }

  audit_log_config {
    log_type = "DATA_READ"
    # TODO: 大量のログが発生する場合は exempted_members で除外対象を設定すること
  }

  audit_log_config {
    log_type = "DATA_WRITE"
  }
}

# ------------------------------------------------------------------------------
# ログ集約シンク（フォルダレベル）
# ------------------------------------------------------------------------------

resource "google_logging_folder_sink" "audit_sink" {
  name             = "${var.org_prefix}-audit-log-sink"
  folder           = var.folder_id
  destination      = "storage.googleapis.com/${google_storage_bucket.audit_logs.name}"
  include_children = true

  # TODO: フィルタを調整して必要なログのみ集約すること
  filter = "logName:\"cloudaudit.googleapis.com\""
}

# ------------------------------------------------------------------------------
# 監査ログ保管用 GCS バケット
# ------------------------------------------------------------------------------

resource "google_storage_bucket" "audit_logs" {
  name     = "${var.org_prefix}-foundation-audit-logs" # TODO: バケット名がグローバルで一意になるよう調整すること
  location = "asia-northeast1"
  project  = var.project_ids["production"] # TODO: 監査ログ専用プロジェクトがある場合はそちらを使用すること

  # 365 日間のリテンション（ロック付き）
  retention_policy {
    is_locked        = true
    retention_period = 31536000 # TODO: 365 日 = 31,536,000 秒。規制要件に応じて調整すること
  }

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 730 # TODO: 2 年後に Coldline へ移行。保管要件に応じて調整すること
    }
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }

  # TODO: 削除保護を有効化すること（本番運用時）
  # force_destroy = false
}

# ------------------------------------------------------------------------------
# シンク用サービスアカウントへの書き込み権限
# ------------------------------------------------------------------------------

resource "google_storage_bucket_iam_member" "sink_writer" {
  bucket = google_storage_bucket.audit_logs.name
  role   = "roles/storage.objectCreator"
  member = google_logging_folder_sink.audit_sink.writer_identity
}

# ------------------------------------------------------------------------------
# 出力
# ------------------------------------------------------------------------------

output "audit_bucket_name" {
  description = "監査ログバケット名"
  value       = google_storage_bucket.audit_logs.name
}

output "audit_sink_name" {
  description = "監査ログシンク名"
  value       = google_logging_folder_sink.audit_sink.name
}
