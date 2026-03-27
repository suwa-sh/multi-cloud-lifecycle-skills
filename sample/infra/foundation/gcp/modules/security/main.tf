# ==============================================================================
# セキュリティ — Security Command Center (SCC)
# ==============================================================================

variable "org_id" {
  type = string
}

# ------------------------------------------------------------------------------
# Security Command Center
#
# TODO: SCC Standard ティアの有効化について
#
# SCC Standard ティアは Terraform での完全な管理が制限されている。
# 以下の手順で手動有効化すること:
#
# 1. Google Cloud Console > Security Command Center に移動
# 2. 組織レベルで SCC Standard ティアを有効化
# 3. BigQuery 関連の検出機能が有効であることを確認:
#    - BigQuery データの公開アクセス検出
#    - 異常なクエリパターンの検出
#    - データ漏洩の兆候検出
#
# Premium ティアが必要な場合:
# - Security Health Analytics のカスタムモジュール
# - Event Threat Detection
# - Container Threat Detection（本環境では不要）
#
# TODO: SCC の通知設定を構成すること
# TODO: SCC の検出結果を SIEM に転送する場合は Pub/Sub エクスポートを設定すること
# ------------------------------------------------------------------------------

# SCC 通知設定（組織レベル）
# TODO: SCC が手動で有効化された後にコメントを解除すること
# resource "google_scc_notification_config" "critical_findings" {
#   config_id    = "critical-findings-notification"
#   organization = var.org_id
#   description  = "重大な SCC 検出結果の通知"
#   pubsub_topic = "projects/PROJECT_ID/topics/scc-critical-findings" # TODO: 通知先の Pub/Sub トピックを設定すること
#
#   streaming_config {
#     filter = "severity = \"CRITICAL\" OR severity = \"HIGH\""
#   }
# }

# BigQuery 固有のカスタムモジュール（SCC Premium が必要）
# TODO: Premium ティアを契約した場合はコメントを解除すること
# resource "google_scc_organization_custom_module" "bq_public_access" {
#   organization  = var.org_id
#   display_name  = "bigquery-public-access-detector"
#   enablement_state = "ENABLED"
#
#   custom_config {
#     predicate {
#       expression = "resource.type == \"bigquery.googleapis.com/Dataset\" && resource.data.access.specialGroup == \"allAuthenticatedUsers\""
#     }
#     resource_selector {
#       resource_types = ["bigquery.googleapis.com/Dataset"]
#     }
#     severity = "CRITICAL"
#     description = "BigQuery データセットへの公開アクセスを検出"
#     recommendation = "データセットの IAM ポリシーから allAuthenticatedUsers / allUsers を削除すること"
#   }
# }

# ------------------------------------------------------------------------------
# 出力
# ------------------------------------------------------------------------------

output "scc_setup_instructions" {
  description = "SCC セットアップ手順"
  value       = "TODO: Google Cloud Console から SCC Standard ティアを手動で有効化すること"
}
