# =============================================================================
# ポリシー適用モジュール
# SCP（サービスコントロールポリシー）、AWS Config ルール
# =============================================================================

variable "allowed_regions" {
  description = "利用を許可する AWS リージョン一覧"
  type        = list(string)
}

variable "organization_root_id" {
  description = "組織ルート ID"
  type        = string
}

# -----------------------------------------------------------------------------
# SCP: 許可リージョン外の操作を拒否
# -----------------------------------------------------------------------------

resource "aws_organizations_policy" "deny_outside_regions" {
  name        = "deny-outside-regions"
  description = "許可リージョン以外での操作を拒否する"
  type        = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyOutsideRegions"
        Effect    = "Deny"
        NotAction = [
          "a4b:*", "budgets:*", "ce:*", "chime:*",
          "cloudfront:*", "cur:*", "globalaccelerator:*",
          "health:*", "iam:*", "importexport:*",
          "organizations:*", "route53:*", "route53domains:*",
          "s3:GetBucketLocation", "s3:ListAllMyBuckets",
          "shield:*", "sts:*", "support:*", "trustedadvisor:*",
          "waf:*", "wafv2:*", "waf-regional:*",
        ]
        Resource = "*"
        Condition = {
          StringNotEquals = {
            "aws:RequestedRegion" = var.allowed_regions
          }
        }
      }
    ]
  })
}

resource "aws_organizations_policy_attachment" "deny_outside_regions" {
  policy_id = aws_organizations_policy.deny_outside_regions.id
  target_id = var.organization_root_id
}

# -----------------------------------------------------------------------------
# SCP: ルートユーザーの操作を拒否
# -----------------------------------------------------------------------------

resource "aws_organizations_policy" "deny_root_actions" {
  name        = "deny-root-actions"
  description = "ルートユーザーによる操作を拒否する"
  type        = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyRootActions"
        Effect    = "Deny"
        Action    = "*"
        Resource  = "*"
        Condition = {
          StringLike = {
            "aws:PrincipalArn" = "arn:aws:iam::*:root"
          }
        }
      }
    ]
  })
}

resource "aws_organizations_policy_attachment" "deny_root_actions" {
  policy_id = aws_organizations_policy.deny_root_actions.id
  target_id = var.organization_root_id
}

# -----------------------------------------------------------------------------
# SCP: 必須タグの強制
# -----------------------------------------------------------------------------

resource "aws_organizations_policy" "require_tags" {
  name        = "require-tags"
  description = "リソース作成時に必須タグを強制する"
  type        = "SERVICE_CONTROL_POLICY"

  # TODO: 必須タグのキーと対象サービスを組織ポリシーに合わせて調整すること
  content = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyCreateWithoutTags"
        Effect    = "Deny"
        Action = [
          "ec2:RunInstances",
          "ec2:CreateVolume",
          "rds:CreateDBInstance",
          "s3:CreateBucket",
        ]
        Resource = "*"
        Condition = {
          "Null" = {
            "aws:RequestTag/Environment" = "true"
            "aws:RequestTag/Owner"       = "true"
          }
        }
      }
    ]
  })
}

resource "aws_organizations_policy_attachment" "require_tags" {
  policy_id = aws_organizations_policy.require_tags.id
  target_id = var.organization_root_id
}

# -----------------------------------------------------------------------------
# SCP: CloudTrail 無効化の防止
# -----------------------------------------------------------------------------

resource "aws_organizations_policy" "deny_cloudtrail_disable" {
  name        = "deny-cloudtrail-disable"
  description = "CloudTrail の停止・削除を禁止する"
  type        = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyCloudTrailDisable"
        Effect = "Deny"
        Action = [
          "cloudtrail:StopLogging",
          "cloudtrail:DeleteTrail",
          "cloudtrail:UpdateTrail",
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_organizations_policy_attachment" "deny_cloudtrail_disable" {
  policy_id = aws_organizations_policy.deny_cloudtrail_disable.id
  target_id = var.organization_root_id
}

# -----------------------------------------------------------------------------
# SCP: S3 パブリックアクセスの禁止
# -----------------------------------------------------------------------------

resource "aws_organizations_policy" "deny_s3_public" {
  name        = "deny-s3-public"
  description = "S3 バケットのパブリックアクセスを禁止する"
  type        = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyS3PublicAccess"
        Effect = "Deny"
        Action = [
          "s3:PutBucketPublicAccessBlock",
        ]
        Resource = "*"
        Condition = {
          StringNotEquals = {
            "s3:publicAccessBlockConfiguration/BlockPublicAcls"       = "true"
            "s3:publicAccessBlockConfiguration/BlockPublicPolicy"     = "true"
            "s3:publicAccessBlockConfiguration/IgnorePublicAcls"      = "true"
            "s3:publicAccessBlockConfiguration/RestrictPublicBuckets" = "true"
          }
        }
      }
    ]
  })
}

resource "aws_organizations_policy_attachment" "deny_s3_public" {
  policy_id = aws_organizations_policy.deny_s3_public.id
  target_id = var.organization_root_id
}

# -----------------------------------------------------------------------------
# SCP: IAM ユーザー作成の禁止
# -----------------------------------------------------------------------------

resource "aws_organizations_policy" "deny_iam_user_creation" {
  name        = "deny-iam-user-creation"
  description = "IAM ユーザーの作成を禁止する（Identity Center を使用すること）"
  type        = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyIAMUserCreation"
        Effect = "Deny"
        Action = [
          "iam:CreateUser",
          "iam:CreateAccessKey",
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_organizations_policy_attachment" "deny_iam_user_creation" {
  policy_id = aws_organizations_policy.deny_iam_user_creation.id
  target_id = var.organization_root_id
}

# -----------------------------------------------------------------------------
# AWS Config 組織マネージドルール
# -----------------------------------------------------------------------------

# TODO: AWS Config レコーダーを事前にセットアップすること

resource "aws_config_organization_managed_rule" "s3_bucket_versioning" {
  name            = "s3-bucket-versioning-enabled"
  rule_identifier = "S3_BUCKET_VERSIONING_ENABLED"
  # TODO: 除外アカウントがあれば設定すること
  # excluded_accounts = []
}

resource "aws_config_organization_managed_rule" "encrypted_volumes" {
  name            = "encrypted-volumes"
  rule_identifier = "ENCRYPTED_VOLUMES"
}

resource "aws_config_organization_managed_rule" "rds_encryption" {
  name            = "rds-storage-encrypted"
  rule_identifier = "RDS_STORAGE_ENCRYPTED"
}

resource "aws_config_organization_managed_rule" "iam_root_access_key" {
  name            = "iam-root-access-key-check"
  rule_identifier = "IAM_ROOT_ACCESS_KEY_CHECK"
}

resource "aws_config_organization_managed_rule" "mfa_enabled_for_console" {
  name            = "mfa-enabled-for-iam-console-access"
  rule_identifier = "MFA_ENABLED_FOR_IAM_CONSOLE_ACCESS"
}
