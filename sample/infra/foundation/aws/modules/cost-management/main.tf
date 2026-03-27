# =============================================================================
# コスト管理モジュール
# コストカテゴリ、予算、異常検知
# =============================================================================

variable "org_prefix" {
  description = "組織リソースの命名プレフィックス"
  type        = string
}

variable "bu_list" {
  description = "ビジネスユニット一覧"
  type = list(object({
    id   = string
    name = string
  }))
}

# -----------------------------------------------------------------------------
# コストカテゴリ（固定費 / 変動費 分類）
# -----------------------------------------------------------------------------

resource "aws_ce_cost_category" "fixed_variable" {
  name         = "${var.org_prefix}-fixed-variable-split"
  rule_version = "CostCategoryExpression.v1"

  rule {
    value = "固定費"
    rule {
      dimension {
        key           = "SERVICE"
        match_options = ["EQUALS"]
        values = [
          "Amazon Route 53",
          "AWS Direct Connect",
          "AWS Transit Gateway",
          # TODO: 固定費に分類するサービスを追加すること
        ]
      }
    }
  }

  rule {
    value = "変動費"
    rule {
      dimension {
        key           = "SERVICE"
        match_options = ["EQUALS"]
        values = [
          "Amazon EC2",
          "Amazon S3",
          "Amazon RDS",
          "AWS Lambda",
          # TODO: 変動費に分類するサービスを追加すること
        ]
      }
    }
  }

  default_value = "未分類" # TODO: デフォルト分類を確認すること
}

# -----------------------------------------------------------------------------
# 予算テンプレート（BU 別月次予算）
# -----------------------------------------------------------------------------

resource "aws_budgets_budget" "bu_monthly" {
  for_each = { for bu in var.bu_list : bu.id => bu }

  name         = "${var.org_prefix}-${each.value.id}-monthly"
  budget_type  = "COST"
  limit_amount = "1000" # TODO: 各 BU の月次予算上限を設定すること
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  cost_filter {
    name   = "TagKeyValue"
    values = ["user:BusinessUnit$${each.value.id}"]
  }

  # 80% 到達時に通知
  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = 80
    threshold_type            = "PERCENTAGE"
    notification_type         = "ACTUAL"
    subscriber_email_addresses = [
      "# TODO: 予算通知先メールアドレスを設定すること"
    ]
  }

  # 100% 到達時に通知
  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = 100
    threshold_type            = "PERCENTAGE"
    notification_type         = "ACTUAL"
    subscriber_email_addresses = [
      "# TODO: 予算通知先メールアドレスを設定すること"
    ]
  }

  # 予測が 120% を超える場合に通知
  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = 120
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_email_addresses = [
      "# TODO: 予算通知先メールアドレスを設定すること"
    ]
  }
}

# -----------------------------------------------------------------------------
# コスト異常検知
# -----------------------------------------------------------------------------

resource "aws_ce_anomaly_monitor" "service" {
  name              = "${var.org_prefix}-service-anomaly-monitor"
  monitor_type      = "DIMENSIONAL"
  monitor_dimension = "SERVICE"
}

resource "aws_ce_anomaly_monitor" "linked_account" {
  name              = "${var.org_prefix}-account-anomaly-monitor"
  monitor_type      = "DIMENSIONAL"
  monitor_dimension = "SERVICE" # TODO: LINKED_ACCOUNT が利用可能か確認すること
}

resource "aws_ce_anomaly_subscription" "alerts" {
  name = "${var.org_prefix}-anomaly-alerts"

  monitor_arn_list = [
    aws_ce_anomaly_monitor.service.arn,
    aws_ce_anomaly_monitor.linked_account.arn,
  ]

  frequency = "DAILY" # TODO: 通知頻度を要件に合わせて調整すること（DAILY / IMMEDIATE / WEEKLY）

  threshold_expression {
    dimension {
      key           = "ANOMALY_TOTAL_IMPACT_ABSOLUTE"
      match_options = ["GREATER_THAN_OR_EQUAL"]
      values        = ["100"] # TODO: 異常検知の閾値（USD）を調整すること
    }
  }

  subscriber {
    type    = "EMAIL"
    address = "# TODO: 異常検知通知先メールアドレスを設定すること"
  }
}
