# ==============================================================================
# リソース階層 — Analytics フォルダ + 環境別プロジェクト
# ==============================================================================

variable "org_id" {
  type = string
}

variable "billing_account" {
  type = string
}

variable "org_prefix" {
  type = string
}

variable "environments" {
  type = list(string)
}

# ------------------------------------------------------------------------------
# Analytics フォルダ
# ------------------------------------------------------------------------------

resource "google_folder" "analytics" {
  display_name = "${var.org_prefix}-analytics"
  parent       = "organizations/${var.org_id}"
}

# ------------------------------------------------------------------------------
# 環境別プロジェクト
# ------------------------------------------------------------------------------

resource "google_project" "analytics" {
  for_each = toset(var.environments)

  name                = "${var.org_prefix}-analytics-${each.key}"
  project_id          = "${var.org_prefix}-analytics-${each.key}" # TODO: プロジェクト ID がグローバルで一意になるよう調整すること
  folder_id           = google_folder.analytics.name
  billing_account     = var.billing_account
  auto_create_network = false # TODO: デフォルトネットワークは作成しない（BigQuery 専用のため）
}

# ------------------------------------------------------------------------------
# 有効化する API
# ------------------------------------------------------------------------------

locals {
  # TODO: 必要に応じて追加 API を有効化すること
  required_apis = [
    "bigquery.googleapis.com",            # BigQuery
    "logging.googleapis.com",             # Cloud Logging
    "securitycenter.googleapis.com",      # Security Command Center
  ]

  project_api_pairs = flatten([
    for env in var.environments : [
      for api in local.required_apis : {
        key        = "${env}-${api}"
        project_id = google_project.analytics[env].project_id
        api        = api
      }
    ]
  ])
}

resource "google_project_service" "apis" {
  for_each = { for pair in local.project_api_pairs : pair.key => pair }

  project = each.value.project_id
  service = each.value.api

  disable_dependent_services = false
  disable_on_destroy         = false
}

# ------------------------------------------------------------------------------
# 出力
# ------------------------------------------------------------------------------

output "analytics_folder_id" {
  description = "Analytics フォルダ ID"
  value       = google_folder.analytics.name
}

output "project_ids" {
  description = "環境別プロジェクト ID のマップ"
  value       = { for env, project in google_project.analytics : env => project.project_id }
}
