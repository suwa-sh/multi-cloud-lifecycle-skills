# =============================================================================
# セキュリティモジュール
# Security Hub、GuardDuty、EBS デフォルト暗号化
# =============================================================================

variable "security_account_id" {
  description = "セキュリティツーリングアカウント ID（委任管理者）"
  type        = string
}

# -----------------------------------------------------------------------------
# Security Hub（委任管理者）
# -----------------------------------------------------------------------------

resource "aws_securityhub_organization_admin_account" "this" {
  admin_account_id = var.security_account_id
}

# TODO: Security Hub の標準を有効化すること（セキュリティツーリングアカウント側で設定）
# - AWS Foundational Security Best Practices
# - CIS AWS Foundations Benchmark

# -----------------------------------------------------------------------------
# GuardDuty（委任管理者）
# -----------------------------------------------------------------------------

resource "aws_guardduty_organization_admin_account" "this" {
  admin_account_id = var.security_account_id
}

# TODO: GuardDuty の保護プランを有効化すること（セキュリティツーリングアカウント側で設定）
# - S3 Protection
# - EKS Protection
# - Malware Protection

# -----------------------------------------------------------------------------
# EBS デフォルト暗号化
# -----------------------------------------------------------------------------

resource "aws_ebs_encryption_by_default" "this" {
  enabled = true
}

# TODO: デフォルト暗号化キーをカスタム KMS キーに変更する場合は以下を有効化すること
# resource "aws_ebs_default_kms_key" "this" {
#   key_arn = "# TODO: EBS デフォルト暗号化用 KMS キー ARN"
# }
