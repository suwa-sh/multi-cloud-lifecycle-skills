# =============================================================================
# 監査モジュール
# CloudTrail、ログ集約、メトリクスフィルタ、アラーム
# =============================================================================

variable "org_prefix" {
  description = "組織リソースの命名プレフィックス"
  type        = string
}

variable "organization_id" {
  description = "AWS Organizations の組織 ID"
  type        = string
}

# -----------------------------------------------------------------------------
# CloudTrail ログ用 S3 バケット
# -----------------------------------------------------------------------------

resource "aws_s3_bucket" "cloudtrail_logs" {
  bucket = "${var.org_prefix}-cloudtrail-logs"

  tags = {
    Purpose = "cloudtrail-log-archive"
  }
}

resource "aws_s3_bucket_versioning" "cloudtrail_logs" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "cloudtrail_logs" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  rule {
    default_retention {
      mode = "GOVERNANCE"
      days = 365 # TODO: 保持期間を組織ポリシーに合わせて調整すること
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "cloudtrail_logs" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  rule {
    id     = "archive-to-glacier"
    status = "Enabled"

    transition {
      days          = 365 # TODO: Glacier 移行日数を要件に合わせて調整すること
      storage_class = "GLACIER"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "cloudtrail_logs" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "cloudtrail_logs" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AWSCloudTrailAclCheck"
        Effect    = "Allow"
        Principal = { Service = "cloudtrail.amazonaws.com" }
        Action    = "s3:GetBucketAcl"
        Resource  = aws_s3_bucket.cloudtrail_logs.arn
      },
      {
        Sid       = "AWSCloudTrailWrite"
        Effect    = "Allow"
        Principal = { Service = "cloudtrail.amazonaws.com" }
        Action    = "s3:PutObject"
        Resource  = "${aws_s3_bucket.cloudtrail_logs.arn}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      },
    ]
  })
}

# -----------------------------------------------------------------------------
# CloudWatch Logs グループ
# -----------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "cloudtrail" {
  name              = "/aws/cloudtrail/${var.org_prefix}-organization"
  retention_in_days = 90 # TODO: ログ保持期間を要件に合わせて調整すること

  tags = {
    Purpose = "cloudtrail"
  }
}

# TODO: CloudTrail → CloudWatch Logs の IAM ロールを作成すること
resource "aws_iam_role" "cloudtrail_cloudwatch" {
  name = "${var.org_prefix}-cloudtrail-cloudwatch-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "cloudtrail.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "cloudtrail_cloudwatch" {
  name = "cloudtrail-cloudwatch-logs"
  role = aws_iam_role.cloudtrail_cloudwatch.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ]
        Resource = "${aws_cloudwatch_log_group.cloudtrail.arn}:*"
      }
    ]
  })
}

# -----------------------------------------------------------------------------
# CloudTrail（組織トレイル）
# -----------------------------------------------------------------------------

resource "aws_cloudtrail" "organization" {
  name                       = "${var.org_prefix}-organization-trail"
  s3_bucket_name             = aws_s3_bucket.cloudtrail_logs.id
  is_organization_trail      = true
  is_multi_region_trail      = true
  enable_log_file_validation = true

  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.cloudtrail.arn}:*"
  cloud_watch_logs_role_arn  = aws_iam_role.cloudtrail_cloudwatch.arn

  # TODO: KMS 暗号化キーを設定すること
  # kms_key_id = "# TODO: CloudTrail 暗号化用 KMS キー ARN"

  tags = {
    Purpose = "organization-audit"
  }
}

# -----------------------------------------------------------------------------
# メトリクスフィルタ & アラーム
# -----------------------------------------------------------------------------

# コンソールサインイン失敗
resource "aws_cloudwatch_log_metric_filter" "console_sign_in_failures" {
  name           = "ConsoleSignInFailures"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name

  pattern = "{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") }"

  metric_transformation {
    name      = "ConsoleSignInFailureCount"
    namespace = "${var.org_prefix}/CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "console_sign_in_failures" {
  alarm_name          = "${var.org_prefix}-console-sign-in-failures"
  alarm_description   = "コンソールサインイン失敗の検知"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "ConsoleSignInFailureCount"
  namespace           = "${var.org_prefix}/CloudTrailMetrics"
  period              = 300
  statistic           = "Sum"
  threshold           = 3 # TODO: 閾値を運用要件に合わせて調整すること

  alarm_actions = [
    "# TODO: SNS トピック ARN を設定すること"
  ]
}

# 未認可 API コール
resource "aws_cloudwatch_log_metric_filter" "unauthorized_api_calls" {
  name           = "UnauthorizedAPICalls"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name

  pattern = "{ ($.errorCode = \"*UnauthorizedAccess\") || ($.errorCode = \"AccessDenied*\") }"

  metric_transformation {
    name      = "UnauthorizedAPICallCount"
    namespace = "${var.org_prefix}/CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "unauthorized_api_calls" {
  alarm_name          = "${var.org_prefix}-unauthorized-api-calls"
  alarm_description   = "未認可 API コールの検知"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "UnauthorizedAPICallCount"
  namespace           = "${var.org_prefix}/CloudTrailMetrics"
  period              = 300
  statistic           = "Sum"
  threshold           = 5 # TODO: 閾値を運用要件に合わせて調整すること

  alarm_actions = [
    "# TODO: SNS トピック ARN を設定すること"
  ]
}

# ルートアカウント使用
resource "aws_cloudwatch_log_metric_filter" "root_account_usage" {
  name           = "RootAccountUsage"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name

  pattern = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"

  metric_transformation {
    name      = "RootAccountUsageCount"
    namespace = "${var.org_prefix}/CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "root_account_usage" {
  alarm_name          = "${var.org_prefix}-root-account-usage"
  alarm_description   = "ルートアカウント使用の検知"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "RootAccountUsageCount"
  namespace           = "${var.org_prefix}/CloudTrailMetrics"
  period              = 300
  statistic           = "Sum"
  threshold           = 1

  alarm_actions = [
    "# TODO: SNS トピック ARN を設定すること"
  ]
}
