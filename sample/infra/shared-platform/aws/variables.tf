# 共有プラットフォーム - AWS 変数定義

variable "cluster_name" {
  description = "EKS クラスタ名"
  type        = string
  # TODO: デフォルト値を設定するか、tfvars で指定すること
}

variable "environment" {
  description = "デプロイ環境（dev / stg / prd）"
  type        = string
  validation {
    condition     = contains(["dev", "stg", "prd"], var.environment)
    error_message = "environment は dev, stg, prd のいずれかを指定してください。"
  }
}

variable "vpc_id" {
  description = "EKS クラスタをデプロイする VPC の ID"
  type        = string
  # TODO: Foundation レイヤーの出力から参照すること
}

variable "subnet_ids" {
  description = "EKS クラスタのサブネット ID リスト（プライベートサブネット推奨）"
  type        = list(string)
  # TODO: Foundation レイヤーの出力から参照すること
}

variable "eks_version" {
  description = "EKS Kubernetes バージョン"
  type        = string
  default     = "1.30"
  # TODO: 最新の安定バージョンに更新すること
}

variable "grafana_sso_saml_metadata" {
  description = "Grafana SSO 用の Entra ID SAML メタデータ URL"
  type        = string
  default     = ""
  # TODO: Entra ID アプリケーションの SAML メタデータ URL を設定すること
}

variable "github_org" {
  description = "GitHub Organization 名（OIDC 信頼ポリシーで使用）"
  type        = string
  # TODO: GitHub Organization 名を設定すること
}
