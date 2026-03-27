# ==============================================================================
# ID 管理 — BigQuery IAM バインディング + サービスアカウント + Workload Identity
# ==============================================================================

variable "org_id" {
  type = string
}

variable "org_prefix" {
  type = string
}

variable "cloud_identity_domain" {
  type = string
}

variable "environments" {
  type = list(string)
}

variable "project_ids" {
  type = map(string)
}

# ------------------------------------------------------------------------------
# BigQuery IAM バインディング（環境別）
# ------------------------------------------------------------------------------

locals {
  # TODO: 各ロールに割り当てるグループを設定すること
  bigquery_roles = {
    "roles/bigquery.admin"      = "bq-admins"
    "roles/bigquery.dataEditor" = "bq-data-editors"
    "roles/bigquery.dataViewer" = "bq-data-viewers"
    "roles/bigquery.jobUser"    = "bq-job-users"
  }

  iam_bindings = flatten([
    for env in var.environments : [
      for role, group_suffix in local.bigquery_roles : {
        key        = "${env}-${group_suffix}"
        project_id = var.project_ids[env]
        role       = role
        group      = "${var.org_prefix}-${env}-${group_suffix}@${var.cloud_identity_domain}" # TODO: 実際のグループアドレスに変更すること
      }
    ]
  ])
}

resource "google_project_iam_binding" "bigquery" {
  for_each = { for binding in local.iam_bindings : binding.key => binding }

  project = each.value.project_id
  role    = each.value.role

  members = [
    "group:${each.value.group}",
  ]
}

# ------------------------------------------------------------------------------
# サービスアカウント
# ------------------------------------------------------------------------------

resource "google_service_account" "data_ingestion" {
  for_each = toset(var.environments)

  account_id   = "sa-data-ingestion"
  display_name = "データ取り込み用サービスアカウント（${each.key}）"
  project      = var.project_ids[each.key]
  # TODO: 必要最小限の権限を付与すること
}

resource "google_service_account" "saas_ingestion" {
  for_each = toset(var.environments)

  account_id   = "sa-saas-ingestion"
  display_name = "SaaS データ取り込み用サービスアカウント（${each.key}）"
  project      = var.project_ids[each.key]
  # TODO: 必要最小限の権限を付与すること
}

# ------------------------------------------------------------------------------
# Workload Identity Federation（AWS 連携用）
# ------------------------------------------------------------------------------

resource "google_iam_workload_identity_pool" "aws_federation" {
  for_each = toset(var.environments)

  workload_identity_pool_id = "${var.org_prefix}-aws-federation"
  display_name              = "AWS フェデレーションプール（${each.key}）"
  project                   = var.project_ids[each.key]
  # TODO: プール設定を環境に合わせて調整すること
}

resource "google_iam_workload_identity_pool_provider" "aws_provider" {
  for_each = toset(var.environments)

  workload_identity_pool_id          = google_iam_workload_identity_pool.aws_federation[each.key].workload_identity_pool_id
  workload_identity_pool_provider_id = "aws-provider"
  display_name                       = "AWS プロバイダー（${each.key}）"
  project                            = var.project_ids[each.key]

  aws {
    account_id = "000000000000" # TODO: 連携先の AWS アカウント ID を設定すること
  }

  attribute_mapping = {
    "google.subject"     = "assertion.arn"
    "attribute.aws_role" = "assertion.arn"
  }

  # TODO: attribute_condition で許可する IAM ロールを制限すること
  # attribute_condition = "assertion.arn.startsWith('arn:aws:sts::000000000000:assumed-role/allowed-role')"
}

# ------------------------------------------------------------------------------
# 出力
# ------------------------------------------------------------------------------

output "data_ingestion_sa_emails" {
  description = "データ取り込みサービスアカウントのメールアドレス"
  value       = { for env, sa in google_service_account.data_ingestion : env => sa.email }
}

output "saas_ingestion_sa_emails" {
  description = "SaaS 取り込みサービスアカウントのメールアドレス"
  value       = { for env, sa in google_service_account.saas_ingestion : env => sa.email }
}

output "workload_identity_pool_names" {
  description = "Workload Identity プール名"
  value       = { for env, pool in google_iam_workload_identity_pool.aws_federation : env => pool.name }
}
