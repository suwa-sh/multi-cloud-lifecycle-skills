# ==============================================================================
# Entra ID モジュール
# BU グループ・ロールグループ・AWS SSO アプリ・条件付きアクセス・Break Glass
# ==============================================================================

# ------------------------------------------------------------------------------
# 変数
# ------------------------------------------------------------------------------
variable "tenant_id" {
  description = "Entra ID テナント ID"
  type        = string
}

variable "entra_domain" {
  description = "Entra ID プライマリドメイン"
  type        = string
}

variable "aws_iam_identity_center_saml_metadata_url" {
  description = "AWS IAM Identity Center の SAML メタデータ URL"
  type        = string
}

# ------------------------------------------------------------------------------
# データソース
# ------------------------------------------------------------------------------
data "azuread_client_config" "current" {}

# ==============================================================================
# BU グループ（8 グループ）
# ==============================================================================
locals {
  bu_groups = [
    "SG-BU-Corporate",      # TODO: 実際の BU 名に変更すること
    "SG-BU-Sales",           # TODO: 実際の BU 名に変更すること
    "SG-BU-Marketing",       # TODO: 実際の BU 名に変更すること
    "SG-BU-Engineering",     # TODO: 実際の BU 名に変更すること
    "SG-BU-Finance",         # TODO: 実際の BU 名に変更すること
    "SG-BU-HR",              # TODO: 実際の BU 名に変更すること
    "SG-BU-Operations",      # TODO: 実際の BU 名に変更すること
    "SG-BU-Research",        # TODO: 実際の BU 名に変更すること
  ]
}

resource "azuread_group" "bu" {
  for_each = toset(local.bu_groups)

  display_name     = each.value
  security_enabled = true
  # TODO: 必要に応じて description, owners, members を設定すること
}

# ==============================================================================
# ロールグループ（4 グループ — AWS ロールマッピング用）
# ==============================================================================
locals {
  role_groups = [
    "SG-AWS-Admin",            # TODO: AWS AdministratorAccess にマッピング
    "SG-AWS-PowerUser-Dev",    # TODO: AWS PowerUserAccess（Dev 環境）にマッピング
    "SG-AWS-ReadOnly-Prod",    # TODO: AWS ReadOnlyAccess（Prod 環境）にマッピング
    "SG-AWS-Billing",          # TODO: AWS Billing にマッピング
  ]
}

resource "azuread_group" "role" {
  for_each = toset(local.role_groups)

  display_name     = each.value
  security_enabled = true
  # TODO: 必要に応じて description, owners, members を設定すること
}

# ==============================================================================
# AWS IAM Identity Center SSO アプリケーション（SAML）
# ==============================================================================
resource "azuread_application" "aws_sso" {
  display_name = "AWS IAM Identity Center" # TODO: 表示名を組織の命名規則に合わせること

  web {
    redirect_uris = [
      "https://signin.aws.amazon.com/saml", # TODO: AWS SSO の ACS URL を確認すること
    ]
  }

  # TODO: SAML 署名証明書・クレーム・属性マッピングは Azure Portal で追加構成が必要
  # TODO: identifier_uris に AWS 側の Entity ID を設定すること
}

resource "azuread_service_principal" "aws_sso" {
  client_id                    = azuread_application.aws_sso.client_id
  app_role_assignment_required = true # TODO: 割り当て済みユーザー/グループのみアクセス可
  # TODO: SAML SSO 設定は Azure Portal から追加構成が必要
  #       - サインオン URL
  #       - SAML メタデータ URL: var.aws_iam_identity_center_saml_metadata_url
  #       - 属性とクレームの構成
}

# ==============================================================================
# Break Glass ユーザー（緊急アクセス用）
# ==============================================================================
resource "azuread_user" "break_glass_1" {
  user_principal_name = "break-glass-01@${var.entra_domain}" # TODO: 命名規則を確認すること
  display_name        = "Break Glass 01"
  password            = "ChangeMe!Initial#001"               # TODO: 初期パスワード。作成後に即座にローテーションすること
  force_password_change = true                               # TODO: 初回ログイン時にパスワード変更を強制

  # TODO: MFA は条件付きアクセスの除外で制御。FIDO2 セキュリティキー等を別途登録すること
  # TODO: アカウント情報は金庫等に安全に保管すること
}

resource "azuread_user" "break_glass_2" {
  user_principal_name = "break-glass-02@${var.entra_domain}" # TODO: 命名規則を確認すること
  display_name        = "Break Glass 02"
  password            = "ChangeMe!Initial#002"               # TODO: 初期パスワード。作成後に即座にローテーションすること
  force_password_change = true                               # TODO: 初回ログイン時にパスワード変更を強制

  # TODO: Break Glass 01 とは異なる管理者が保管すること
}

# ==============================================================================
# Named Location（Break Glass 除外用）
# ==============================================================================
resource "azuread_named_location" "break_glass_trusted" {
  display_name = "Break Glass Trusted Location" # TODO: 緊急アクセス時の信頼済み場所を定義

  ip {
    ip_ranges = [
      "203.0.113.0/24", # TODO: Break Glass アクセス元の IP 範囲を設定すること
    ]
    trusted = true
  }
}

# ==============================================================================
# 条件付きアクセスポリシー
# ==============================================================================

# --- CA-001: 全ユーザーに MFA を要求 ---
resource "azuread_conditional_access_policy" "ca_001_mfa_all_users" {
  display_name = "CA-001: 全ユーザー MFA 必須"
  state        = "enabledForReportingButNotEnforced" # TODO: テスト後に "enabled" に変更すること

  conditions {
    client_app_types = ["all"]

    applications {
      included_applications = ["All"]
    }

    users {
      included_users = ["All"]
      excluded_users = [
        azuread_user.break_glass_1.object_id,
        azuread_user.break_glass_2.object_id,
      ]
    }
  }

  grant_controls {
    operator                      = "OR"
    built_in_controls             = ["mfa"]
  }
}

# --- CA-002: 高リスクサインインをブロック ---
resource "azuread_conditional_access_policy" "ca_002_block_high_risk" {
  display_name = "CA-002: 高リスクサインインのブロック"
  state        = "enabledForReportingButNotEnforced" # TODO: テスト後に "enabled" に変更すること

  conditions {
    client_app_types = ["all"]

    applications {
      included_applications = ["All"]
    }

    users {
      included_users = ["All"]
      excluded_users = [
        azuread_user.break_glass_1.object_id,
        azuread_user.break_glass_2.object_id,
      ]
    }

    sign_in_risk_levels = ["high"]
  }

  grant_controls {
    operator          = "OR"
    built_in_controls = ["block"]
  }
}

# --- CA-003: 中リスクサインインに MFA を要求 ---
resource "azuread_conditional_access_policy" "ca_003_mfa_medium_risk" {
  display_name = "CA-003: 中リスクサインイン MFA 必須"
  state        = "enabledForReportingButNotEnforced" # TODO: テスト後に "enabled" に変更すること

  conditions {
    client_app_types = ["all"]

    applications {
      included_applications = ["All"]
    }

    users {
      included_users = ["All"]
      excluded_users = [
        azuread_user.break_glass_1.object_id,
        azuread_user.break_glass_2.object_id,
      ]
    }

    sign_in_risk_levels = ["medium"]
  }

  grant_controls {
    operator          = "OR"
    built_in_controls = ["mfa"]
  }
}

# --- CA-004: AWS アクセス時のセッション有効期間を 8 時間に制限 ---
resource "azuread_conditional_access_policy" "ca_004_session_aws" {
  display_name = "CA-004: AWS セッション頻度 8 時間"
  state        = "enabledForReportingButNotEnforced" # TODO: テスト後に "enabled" に変更すること

  conditions {
    client_app_types = ["all"]

    applications {
      included_applications = [
        azuread_application.aws_sso.client_id, # TODO: AWS SSO アプリの Application ID を確認すること
      ]
    }

    users {
      included_users = ["All"]
      excluded_users = [
        azuread_user.break_glass_1.object_id,
        azuread_user.break_glass_2.object_id,
      ]
    }
  }

  grant_controls {
    operator          = "OR"
    built_in_controls = ["mfa"]
  }

  session_controls {
    sign_in_frequency {
      value = 8    # TODO: 組織のセキュリティポリシーに応じて調整すること
      type  = "hours"
    }
  }
}
