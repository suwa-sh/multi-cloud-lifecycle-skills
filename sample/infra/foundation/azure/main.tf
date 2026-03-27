# ==============================================================================
# Azure 基盤レイヤー — IdP（Entra ID）専用構成
# Azure は IdP としてのみ利用し、インフラリソースは配置しない
# ==============================================================================

terraform {
  required_version = ">= 1.5"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # TODO: バックエンド設定を環境に合わせて構成すること
  # backend "azurerm" {}
}

provider "azuread" {
  tenant_id = var.tenant_id # TODO: Entra ID テナント ID を設定すること
}

provider "azurerm" {
  features {}
  tenant_id       = var.tenant_id       # TODO: テナント ID を設定すること
  subscription_id = "not-used"          # TODO: IdP 専用のため未使用だが、プロバイダー初期化に必要
  skip_provider_registration = true     # TODO: IdP 専用のためリソースプロバイダー登録は不要
}

# ==============================================================================
# モジュール: Entra ID（グループ・SSO アプリ・条件付きアクセス・Break Glass）
# ==============================================================================
module "entra_id" {
  source = "./modules/entra-id"

  tenant_id                                 = var.tenant_id
  entra_domain                              = var.entra_domain
  aws_iam_identity_center_saml_metadata_url = var.aws_iam_identity_center_saml_metadata_url
}
