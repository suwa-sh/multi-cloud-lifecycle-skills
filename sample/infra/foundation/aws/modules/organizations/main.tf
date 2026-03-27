# =============================================================================
# AWS Organizations モジュール
# 組織構造、OU 階層、アカウント管理
# =============================================================================

variable "org_prefix" {
  description = "組織リソースの命名プレフィックス"
  type        = string
}

variable "management_account_email" {
  description = "管理アカウントのルートメールアドレス"
  type        = string
}

variable "bu_list" {
  description = "ビジネスユニット一覧"
  type = list(object({
    id   = string
    name = string
  }))
}

variable "environments" {
  description = "環境一覧"
  type        = list(string)
}

# -----------------------------------------------------------------------------
# Organization
# -----------------------------------------------------------------------------

resource "aws_organizations_organization" "this" {
  feature_set = "ALL"

  enabled_policy_types = [
    "SERVICE_CONTROL_POLICY",
  ]

  # TODO: 必要に応じて追加のポリシータイプを有効化すること
  # "TAG_POLICY", "BACKUP_POLICY", "AISERVICES_OPT_OUT_POLICY"

  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "guardduty.amazonaws.com",
    "securityhub.amazonaws.com",
    "sso.amazonaws.com",
    # TODO: 必要なサービスプリンシパルを追加すること
  ]
}

# -----------------------------------------------------------------------------
# OU 階層
# -----------------------------------------------------------------------------

resource "aws_organizations_organizational_unit" "security" {
  name      = "Security"
  parent_id = aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_organizational_unit" "infrastructure" {
  name      = "Infrastructure"
  parent_id = aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_organizational_unit" "workloads" {
  name      = "Workloads"
  parent_id = aws_organizations_organization.this.roots[0].id
}

# Workloads 配下に BU 別 OU を作成
resource "aws_organizations_organizational_unit" "bu" {
  for_each = { for bu in var.bu_list : bu.id => bu }

  name      = each.value.name
  parent_id = aws_organizations_organizational_unit.workloads.id
}

resource "aws_organizations_organizational_unit" "sandbox" {
  name      = "Sandbox"
  parent_id = aws_organizations_organization.this.roots[0].id
}

# -----------------------------------------------------------------------------
# コアアカウント
# -----------------------------------------------------------------------------

resource "aws_organizations_account" "log_archive" {
  name  = "${var.org_prefix}-log-archive"
  email = "# TODO: ログアーカイブアカウントのメールアドレスを設定すること"

  parent_id = aws_organizations_organizational_unit.security.id

  lifecycle {
    ignore_changes = [email]
  }

  tags = {
    AccountType = "log-archive"
  }
}

resource "aws_organizations_account" "security_tooling" {
  name  = "${var.org_prefix}-security-tooling"
  email = "# TODO: セキュリティツーリングアカウントのメールアドレスを設定すること"

  parent_id = aws_organizations_organizational_unit.security.id

  lifecycle {
    ignore_changes = [email]
  }

  tags = {
    AccountType = "security-tooling"
  }
}

resource "aws_organizations_account" "network_hub" {
  name  = "${var.org_prefix}-network-hub"
  email = "# TODO: ネットワークハブアカウントのメールアドレスを設定すること"

  parent_id = aws_organizations_organizational_unit.infrastructure.id

  lifecycle {
    ignore_changes = [email]
  }

  tags = {
    AccountType = "network-hub"
  }
}

resource "aws_organizations_account" "shared_services" {
  name  = "${var.org_prefix}-shared-services"
  email = "# TODO: 共有サービスアカウントのメールアドレスを設定すること"

  parent_id = aws_organizations_organizational_unit.infrastructure.id

  lifecycle {
    ignore_changes = [email]
  }

  tags = {
    AccountType = "shared-services"
  }
}

resource "aws_organizations_account" "sandbox" {
  name  = "${var.org_prefix}-sandbox"
  email = "# TODO: サンドボックスアカウントのメールアドレスを設定すること"

  parent_id = aws_organizations_organizational_unit.sandbox.id

  lifecycle {
    ignore_changes = [email]
  }

  tags = {
    AccountType = "sandbox"
  }
}

# -----------------------------------------------------------------------------
# BU × 環境 アカウント
# -----------------------------------------------------------------------------

locals {
  bu_env_accounts = flatten([
    for bu in var.bu_list : [
      for env in var.environments : {
        key   = "${bu.id}-${env}"
        bu_id = bu.id
        env   = env
      }
    ]
  ])
}

resource "aws_organizations_account" "bu_workload" {
  for_each = { for a in local.bu_env_accounts : a.key => a }

  name  = "${var.org_prefix}-${each.value.bu_id}-${each.value.env}"
  email = "# TODO: ${each.key} アカウントのメールアドレスを設定すること"

  parent_id = aws_organizations_organizational_unit.bu[each.value.bu_id].id

  lifecycle {
    ignore_changes = [email]
  }

  tags = {
    AccountType  = "workload"
    BusinessUnit = each.value.bu_id
    Environment  = each.value.env
  }
}

# -----------------------------------------------------------------------------
# 出力
# -----------------------------------------------------------------------------

output "organization_id" {
  description = "AWS Organizations の組織 ID"
  value       = aws_organizations_organization.this.id
}

output "root_id" {
  description = "組織ルート ID"
  value       = aws_organizations_organization.this.roots[0].id
}

output "security_tooling_account_id" {
  description = "セキュリティツーリングアカウント ID"
  value       = aws_organizations_account.security_tooling.id
}

output "log_archive_account_id" {
  description = "ログアーカイブアカウント ID"
  value       = aws_organizations_account.log_archive.id
}

output "network_hub_account_id" {
  description = "ネットワークハブアカウント ID"
  value       = aws_organizations_account.network_hub.id
}
