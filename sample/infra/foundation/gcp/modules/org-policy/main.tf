# ==============================================================================
# 組織ポリシー — BigQuery 専用環境向けガードレール
# ==============================================================================

variable "org_id" {
  type = string
}

variable "cloud_identity_domain" {
  type = string
}

variable "folder_id" {
  type = string
}

# ------------------------------------------------------------------------------
# リソースロケーション制限（asia-northeast1 のみ）
# ------------------------------------------------------------------------------

resource "google_org_policy_policy" "resource_locations" {
  name   = "${var.folder_id}/policies/gcp.resourceLocations"
  parent = var.folder_id

  spec {
    rules {
      values {
        allowed_values = ["in:asia-northeast1-locations"]
      }
    }
  }
  # TODO: 災害対策でセカンダリリージョンが必要な場合は allowed_values に追加すること
}

# ------------------------------------------------------------------------------
# サービスアカウントキー作成の禁止
# ------------------------------------------------------------------------------

resource "google_org_policy_policy" "disable_sa_key_creation" {
  name   = "${var.folder_id}/policies/iam.disableServiceAccountKeyCreation"
  parent = var.folder_id

  spec {
    rules {
      enforce = "TRUE"
    }
  }
  # TODO: Workload Identity Federation を使用するため、キー作成は禁止する
}

# ------------------------------------------------------------------------------
# デフォルト VPC ネットワーク作成のスキップ
# ------------------------------------------------------------------------------

resource "google_org_policy_policy" "skip_default_network" {
  name   = "${var.folder_id}/policies/compute.skipDefaultNetworkCreation"
  parent = var.folder_id

  spec {
    rules {
      enforce = "TRUE"
    }
  }
  # TODO: BigQuery 専用のため VPC は不要。必要になった場合は明示的に作成すること
}

# ------------------------------------------------------------------------------
# IAM ポリシーメンバーのドメイン制限
# ------------------------------------------------------------------------------

resource "google_org_policy_policy" "allowed_policy_member_domains" {
  name   = "${var.folder_id}/policies/iam.allowedPolicyMemberDomains"
  parent = var.folder_id

  spec {
    rules {
      values {
        allowed_values = [
          "C00000000", # TODO: Cloud Identity / Workspace の顧客 ID を設定すること
        ]
      }
    }
  }
  # TODO: 外部パートナーにアクセスを許可する場合はドメインを追加すること
}
