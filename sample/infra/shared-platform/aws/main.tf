# 共有プラットフォーム - AWS ルート Terraform モジュール
# EKS クラスタ、オブザーバビリティ、ArgoCD、ECR、シークレット管理、GitHub OIDC を構成する

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = "~> 2.0"
    }
  }

  # TODO: バックエンド設定を追加（S3 + DynamoDB）
  # backend "s3" {
  #   bucket         = "tfstate-shared-platform"
  #   key            = "shared-platform/terraform.tfstate"
  #   region         = "ap-northeast-1"
  #   dynamodb_table = "tfstate-lock"
  #   encrypt        = true
  # }
}

# --- プロバイダー設定 ---

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy   = "terraform"
      Layer       = "shared-platform"
    }
  }
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_ca_certificate)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_ca_certificate)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
    }
  }
}

provider "kubectl" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_ca_certificate)
  load_config_file       = false

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

# --- データソース ---

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# --- モジュール呼び出し ---

module "eks" {
  source = "./modules/eks"

  cluster_name = var.cluster_name
  environment  = var.environment
  vpc_id       = var.vpc_id
  subnet_ids   = var.subnet_ids
  eks_version  = var.eks_version
}

module "observability" {
  source = "./modules/observability"

  cluster_name              = module.eks.cluster_name
  cluster_endpoint          = module.eks.cluster_endpoint
  environment               = var.environment
  grafana_sso_saml_metadata = var.grafana_sso_saml_metadata

  depends_on = [module.eks]
}

module "argocd" {
  source = "./modules/argocd"

  cluster_name = module.eks.cluster_name
  environment  = var.environment

  depends_on = [module.eks]
}

module "ecr" {
  source = "./modules/ecr"

  environment = var.environment
}

module "secrets" {
  source = "./modules/secrets" # TODO: secrets モジュールを実装

  environment = var.environment

  depends_on = [module.eks]
}

module "github_oidc" {
  source = "./modules/github-oidc"

  github_org  = var.github_org
  environment = var.environment
}

# --- 出力 ---

output "eks_cluster_name" {
  description = "EKS クラスタ名"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS クラスタエンドポイント"
  value       = module.eks.cluster_endpoint
}

output "ecr_registry_url" {
  description = "ECR レジストリ URL"
  value       = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com"
}

output "grafana_workspace_url" {
  description = "Grafana ワークスペース URL"
  value       = module.observability.grafana_workspace_url
}

output "github_actions_ci_role_arn" {
  description = "GitHub Actions CI 用 IAM ロール ARN"
  value       = module.github_oidc.ci_role_arn
}
