# ==============================================================================
# VPC Service Controls — BigQuery + Cloud Storage の境界防御
# ==============================================================================

variable "org_id" {
  type = string
}

variable "org_prefix" {
  type = string
}

variable "project_ids" {
  type = map(string)
}

# ------------------------------------------------------------------------------
# アクセスポリシー
# ------------------------------------------------------------------------------

resource "google_access_context_manager_access_policy" "analytics" {
  parent = "organizations/${var.org_id}"
  title  = "${var.org_prefix}-analytics-access-policy"
  # TODO: 組織に既存のアクセスポリシーがある場合は data ソースで参照すること
  # 組織あたり 1 つのアクセスポリシーのみ作成可能
}

# ------------------------------------------------------------------------------
# サービス境界（BigQuery + Cloud Storage）
# ------------------------------------------------------------------------------

resource "google_access_context_manager_service_perimeter" "analytics" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.analytics.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.analytics.name}/servicePerimeters/${var.org_prefix}_analytics_perimeter"
  title  = "${var.org_prefix}-analytics-perimeter"

  status {
    resources = [
      for project_id in values(var.project_ids) :
      "projects/${project_id}"
    ]

    restricted_services = [
      "bigquery.googleapis.com",
      "storage.googleapis.com",
    ]

    # TODO: VPC アクセス可能サービスを必要に応じて制限すること
    vpc_accessible_services {
      enable_restriction = true
      allowed_services = [
        "bigquery.googleapis.com",
        "storage.googleapis.com",
        "logging.googleapis.com",
      ]
    }

    # TODO: 外部からのアクセスが必要な場合は ingress_policies を設定すること
    # ingress_policies {
    #   ingress_from {
    #     sources {
    #       access_level = "accessPolicies/.../accessLevels/..."
    #     }
    #   }
    #   ingress_to {
    #     resources = ["*"]
    #     operations {
    #       service_name = "bigquery.googleapis.com"
    #       method_selectors {
    #         method = "*"
    #       }
    #     }
    #   }
    # }

    # TODO: 外部へのデータ持ち出しが必要な場合は egress_policies を設定すること
    # egress_policies { ... }
  }
}

# ------------------------------------------------------------------------------
# 出力
# ------------------------------------------------------------------------------

output "access_policy_name" {
  description = "アクセスポリシー名"
  value       = google_access_context_manager_access_policy.analytics.name
}

output "service_perimeter_name" {
  description = "サービス境界名"
  value       = google_access_context_manager_service_perimeter.analytics.name
}
