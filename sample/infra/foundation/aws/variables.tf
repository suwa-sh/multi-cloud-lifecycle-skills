# =============================================================================
# AWS 基盤レイヤー 変数定義
# =============================================================================

variable "org_prefix" {
  description = "組織リソースの命名プレフィックス"
  type        = string
  default     = "# TODO: 組織プレフィックスを設定すること（例: mycompany）"
}

variable "management_account_email" {
  description = "管理アカウントのルートメールアドレス"
  type        = string
  # TODO: 管理アカウントのメールアドレスを指定すること
}

variable "bu_list" {
  description = "ビジネスユニット一覧"
  type = list(object({
    id   = string
    name = string
  }))
  default = [
    { id = "ccoe", name = "CCoE" },
    { id = "marketing", name = "マーケティング" },
    { id = "sales", name = "営業" },
    { id = "development", name = "開発" },
    { id = "customer-success", name = "カスタマーサクセス" },
    { id = "accounting", name = "経理" },
    { id = "general-affairs", name = "総務" },
    { id = "executive", name = "経営企画" },
  ]
}

variable "environments" {
  description = "環境一覧"
  type        = list(string)
  default     = ["production", "staging", "development"]
}

variable "allowed_regions" {
  description = "利用を許可する AWS リージョン一覧"
  type        = list(string)
  default     = ["ap-northeast-1", "us-east-1"]
}
