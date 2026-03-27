# ==============================================================================
# GCP 基盤レイヤー — BigQuery データ分析専用
# ==============================================================================

terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.0"
    }
  }

  # TODO: バックエンド設定を追加すること（例: GCS バケット）
  # backend "gcs" {
  #   bucket = "your-tfstate-bucket"
  #   prefix = "foundation"
  # }
}

provider "google" {
  project = var.org_prefix # TODO: 管理用プロジェクト ID に変更すること
  region  = "asia-northeast1"
}

provider "google-beta" {
  project = var.org_prefix # TODO: 管理用プロジェクト ID に変更すること
  region  = "asia-northeast1"
}

# ------------------------------------------------------------------------------
# モジュール呼び出し
# ------------------------------------------------------------------------------

module "resource_hierarchy" {
  source = "./modules/resource-hierarchy"

  org_id          = var.org_id
  billing_account = var.billing_account_id
  org_prefix      = var.org_prefix
  environments    = var.environments
}

module "identity" {
  source = "./modules/identity"

  org_id                = var.org_id
  org_prefix            = var.org_prefix
  cloud_identity_domain = var.cloud_identity_domain
  environments          = var.environments
  project_ids           = module.resource_hierarchy.project_ids
}

module "org_policy" {
  source = "./modules/org-policy"

  org_id                = var.org_id
  cloud_identity_domain = var.cloud_identity_domain
  folder_id             = module.resource_hierarchy.analytics_folder_id
}

module "vpc_sc" {
  source = "./modules/vpc-sc"

  org_id      = var.org_id
  org_prefix  = var.org_prefix
  project_ids = module.resource_hierarchy.project_ids
}

module "audit" {
  source = "./modules/audit"

  org_prefix   = var.org_prefix
  environments = var.environments
  project_ids  = module.resource_hierarchy.project_ids
  folder_id    = module.resource_hierarchy.analytics_folder_id
}

module "security" {
  source = "./modules/security"

  org_id = var.org_id
}
