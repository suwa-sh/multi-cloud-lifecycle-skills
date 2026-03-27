# ==============================================================================
# 入力変数
# ==============================================================================

variable "tenant_id" {
  description = "Entra ID テナント ID"
  type        = string
  # TODO: terraform.tfvars または環境変数 TF_VAR_tenant_id で指定すること
}

variable "entra_domain" {
  description = "Entra ID プライマリドメイン（例: example.onmicrosoft.com）"
  type        = string
  # TODO: terraform.tfvars または環境変数 TF_VAR_entra_domain で指定すること
}

variable "aws_iam_identity_center_saml_metadata_url" {
  description = "AWS IAM Identity Center の SAML メタデータ URL"
  type        = string
  # TODO: AWS 側で IAM Identity Center を構成後にメタデータ URL を取得して設定すること
}
