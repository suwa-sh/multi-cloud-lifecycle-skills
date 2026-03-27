# ECR モジュール
# ECR リポジトリ、ライフサイクルポリシー、拡張スキャンを構成する

variable "environment" {
  description = "デプロイ環境"
  type        = string
}

variable "repository_names" {
  description = "作成する ECR リポジトリ名のリスト"
  type        = list(string)
  default     = [] # TODO: チーム/サービスの命名規約に従ってリポジトリ名を設定
}

variable "cross_account_ids" {
  description = "クロスアカウントアクセスを許可するアカウント ID"
  type        = list(string)
  default     = [] # TODO: 本番アカウント等のアカウント ID を設定
}

# --- ECR レジストリスキャン設定 ---

resource "aws_ecr_registry_scanning_configuration" "main" {
  scan_type = "ENHANCED"

  rule {
    scan_frequency = "CONTINUOUS_SCAN"
    repository_filter {
      filter      = "*"
      filter_type = "WILDCARD"
    }
  }
}

# --- ECR リポジトリ ---

resource "aws_ecr_repository" "repos" {
  for_each = toset(var.repository_names)

  name                 = each.value
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = "" # TODO: KMS キー ARN を設定（空文字列の場合は AWS マネージドキーを使用）
  }

  tags = {
    Name        = each.value
    Environment = var.environment
  }
}

# --- ライフサイクルポリシー ---

resource "aws_ecr_lifecycle_policy" "repos" {
  for_each = aws_ecr_repository.repos

  repository = each.value.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "未タグイメージを 7 日で削除"
        selection = {
          tagStatus   = "untagged"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = 7
        }
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2
        description  = "タグ付きイメージを 100 世代保持"
        selection = {
          tagStatus     = "tagged"
          tagPrefixList = ["v", "release"]
          countType     = "imageCountMoreThan"
          countNumber   = 100
        }
        action = {
          type = "expire"
        }
      },
    ]
  })
}

# --- クロスアカウントアクセスポリシー ---

resource "aws_ecr_repository_policy" "cross_account" {
  for_each = length(var.cross_account_ids) > 0 ? aws_ecr_repository.repos : {}

  repository = each.value.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCrossAccountPull"
        Effect = "Allow"
        Principal = {
          AWS = [for id in var.cross_account_ids : "arn:aws:iam::${id}:root"]
        }
        Action = [
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchCheckLayerAvailability",
        ]
      }
    ]
  })
}

# --- 出力 ---

output "repository_urls" {
  description = "ECR リポジトリ URL マップ"
  value       = { for name, repo in aws_ecr_repository.repos : name => repo.repository_url }
}

output "registry_id" {
  description = "ECR レジストリ ID"
  value       = length(aws_ecr_repository.repos) > 0 ? values(aws_ecr_repository.repos)[0].registry_id : ""
}
