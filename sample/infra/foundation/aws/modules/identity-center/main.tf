# =============================================================================
# IAM Identity Center モジュール
# SSO インスタンス、権限セット
# =============================================================================

# -----------------------------------------------------------------------------
# Identity Center インスタンス（データソース）
# -----------------------------------------------------------------------------

data "aws_ssoadmin_instances" "this" {}

locals {
  sso_instance_arn      = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  sso_identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
}

# -----------------------------------------------------------------------------
# 権限セット
# -----------------------------------------------------------------------------

resource "aws_ssoadmin_permission_set" "administrator_access" {
  name             = "AdministratorAccess"
  description      = "管理者フルアクセス権限"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT1H" # TODO: セッション時間を運用要件に合わせて調整すること

  tags = {
    ManagedBy = "terraform"
  }
}

resource "aws_ssoadmin_managed_policy_attachment" "administrator_access" {
  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.administrator_access.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_ssoadmin_permission_set" "power_user_access" {
  name             = "PowerUserAccess"
  description      = "パワーユーザーアクセス権限（IAM 以外のフルアクセス）"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT4H" # TODO: セッション時間を運用要件に合わせて調整すること

  tags = {
    ManagedBy = "terraform"
  }
}

resource "aws_ssoadmin_managed_policy_attachment" "power_user_access" {
  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.power_user_access.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_ssoadmin_permission_set" "read_only_access" {
  name             = "ReadOnlyAccess"
  description      = "読み取り専用アクセス権限"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT8H" # TODO: セッション時間を運用要件に合わせて調整すること

  tags = {
    ManagedBy = "terraform"
  }
}

resource "aws_ssoadmin_managed_policy_attachment" "read_only_access" {
  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.read_only_access.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_ssoadmin_permission_set" "billing_access" {
  name             = "BillingAccess"
  description      = "請求情報アクセス権限"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT4H" # TODO: セッション時間を運用要件に合わせて調整すること

  tags = {
    ManagedBy = "terraform"
  }
}

resource "aws_ssoadmin_managed_policy_attachment" "billing_access" {
  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.billing_access.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}

# TODO: グループとアカウントへの権限セット割り当てを設定すること
# resource "aws_ssoadmin_account_assignment" "example" {
#   instance_arn       = local.sso_instance_arn
#   permission_set_arn = aws_ssoadmin_permission_set.administrator_access.arn
#   principal_id       = "# TODO: SSO グループ ID"
#   principal_type     = "GROUP"
#   target_id          = "# TODO: AWS アカウント ID"
#   target_type        = "AWS_ACCOUNT"
# }
