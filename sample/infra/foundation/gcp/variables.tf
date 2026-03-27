# ==============================================================================
# GCP 基盤レイヤー — 入力変数
# ==============================================================================

variable "org_id" {
  description = "GCP 組織 ID"
  type        = string
  # TODO: 組織 ID を設定すること（例: "123456789012"）
}

variable "billing_account_id" {
  description = "GCP 請求先アカウント ID"
  type        = string
  # TODO: 請求先アカウント ID を設定すること（例: "ABCDEF-012345-GHIJKL"）
}

variable "org_prefix" {
  description = "組織プレフィックス（リソース名の先頭に付与）"
  type        = string
  # TODO: 組織プレフィックスを設定すること（例: "mycompany"）
}

variable "cloud_identity_domain" {
  description = "Cloud Identity ドメイン"
  type        = string
  # TODO: Cloud Identity ドメインを設定すること（例: "example.com"）
}

variable "environments" {
  description = "環境名のリスト"
  type        = list(string)
  default     = ["production", "staging", "development"]
}
