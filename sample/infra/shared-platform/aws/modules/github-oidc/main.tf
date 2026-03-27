# GitHub OIDC モジュール
# GitHub Actions 用の OIDC プロバイダーと CI/CD IAM ロールを構成する

variable "github_org" {
  description = "GitHub Organization 名"
  type        = string
}

variable "environment" {
  description = "デプロイ環境"
  type        = string
}

variable "github_repos" {
  description = "アクセスを許可する GitHub リポジトリのリスト（空の場合は全リポジトリを許可）"
  type        = list(string)
  default     = [] # TODO: 特定リポジトリに制限すること
}

# --- データソース ---

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# --- GitHub Actions OIDC プロバイダー ---

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1", # TODO: GitHub の最新サムプリントを確認すること
  ]

  tags = {
    Name        = "github-actions-oidc"
    Environment = var.environment
  }
}

# --- CI ロール（ビルド・テスト・ECR プッシュ用） ---

resource "aws_iam_role" "github_actions_ci" {
  name = "github-actions-ci-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_org}/*:*"
            # TODO: 特定リポジトリ・ブランチに制限すること
            # 例: "repo:${var.github_org}/my-service:ref:refs/heads/main"
          }
        }
      }
    ]
  })

  tags = {
    Name        = "github-actions-ci-${var.environment}"
    Environment = var.environment
  }
}

# CI ロールのインラインポリシー（ECR プッシュ権限）
resource "aws_iam_role_policy" "github_actions_ci_ecr" {
  name = "ecr-push-access"
  role = aws_iam_role.github_actions_ci.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
        ]
        Resource = "arn:aws:ecr:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:repository/*"
        # TODO: 特定リポジトリに制限すること
      }
    ]
  })
}

# --- CD ロール（EKS デプロイ・ArgoCD 同期用） ---

resource "aws_iam_role" "github_actions_cd" {
  name = "github-actions-cd-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_org}/*:ref:refs/heads/main"
            # TODO: デプロイを許可するリポジトリ・ブランチを制限すること
          }
        }
      }
    ]
  })

  tags = {
    Name        = "github-actions-cd-${var.environment}"
    Environment = var.environment
  }
}

# CD ロールのインラインポリシー（EKS アクセス権限）
resource "aws_iam_role_policy" "github_actions_cd_eks" {
  name = "eks-deploy-access"
  role = aws_iam_role.github_actions_cd.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "eks:DescribeCluster",
          "eks:ListClusters",
        ]
        Resource = "*" # TODO: 特定クラスタ ARN に制限すること
      },
      {
        Effect = "Allow"
        Action = [
          "sts:AssumeRole",
        ]
        Resource = "*" # TODO: 特定のデプロイ用ロール ARN に制限すること
      }
    ]
  })
}

# --- 出力 ---

output "oidc_provider_arn" {
  description = "GitHub OIDC プロバイダー ARN"
  value       = aws_iam_openid_connect_provider.github.arn
}

output "ci_role_arn" {
  description = "GitHub Actions CI ロール ARN"
  value       = aws_iam_role.github_actions_ci.arn
}

output "cd_role_arn" {
  description = "GitHub Actions CD ロール ARN"
  value       = aws_iam_role.github_actions_cd.arn
}
