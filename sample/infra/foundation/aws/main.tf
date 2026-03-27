# =============================================================================
# AWS 基盤レイヤー ルートモジュール
# =============================================================================

terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # TODO: バックエンド設定（S3 + DynamoDB）を環境に合わせて構成すること
  # backend "s3" {
  #   bucket         = "# TODO: tfstate バケット名"
  #   key            = "foundation/terraform.tfstate"
  #   region         = "ap-northeast-1"
  #   dynamodb_table = "# TODO: ロックテーブル名"
  #   encrypt        = true
  # }
}

# -----------------------------------------------------------------------------
# プロバイダー設定
# -----------------------------------------------------------------------------

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      ManagedBy   = "terraform"
      Layer       = "foundation"
      Environment = "management"
    }
  }
}

# TODO: CloudFront / ACM / WAF 等グローバルリソース用
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"

  default_tags {
    tags = {
      ManagedBy   = "terraform"
      Layer       = "foundation"
      Environment = "management"
    }
  }
}

# -----------------------------------------------------------------------------
# モジュール呼び出し
# -----------------------------------------------------------------------------

module "organizations" {
  source = "./modules/organizations"

  org_prefix               = var.org_prefix
  management_account_email = var.management_account_email
  bu_list                  = var.bu_list
  environments             = var.environments
}

module "cost_management" {
  source = "./modules/cost-management"

  org_prefix = var.org_prefix
  bu_list    = var.bu_list

  depends_on = [module.organizations]
}

module "identity_center" {
  source = "./modules/identity-center"

  depends_on = [module.organizations]
}

module "policy_enforcement" {
  source = "./modules/policy-enforcement"

  allowed_regions     = var.allowed_regions
  organization_root_id = module.organizations.root_id

  depends_on = [module.organizations]
}

module "network" {
  source = "./modules/network"

  org_prefix = var.org_prefix

  depends_on = [module.organizations]
}

module "audit" {
  source = "./modules/audit"

  org_prefix      = var.org_prefix
  organization_id = module.organizations.organization_id

  depends_on = [module.organizations]
}

module "security" {
  source = "./modules/security"

  # TODO: セキュリティツーリングアカウント ID を指定すること
  security_account_id = module.organizations.security_tooling_account_id

  depends_on = [module.organizations]
}
