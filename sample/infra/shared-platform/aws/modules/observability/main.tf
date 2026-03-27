# オブザーバビリティモジュール
# AMP ワークスペース、AMG ワークスペース、ADOT Collector を構成する

variable "cluster_name" {
  description = "EKS クラスタ名"
  type        = string
}

variable "cluster_endpoint" {
  description = "EKS クラスタエンドポイント"
  type        = string
}

variable "environment" {
  description = "デプロイ環境"
  type        = string
}

variable "grafana_sso_saml_metadata" {
  description = "Grafana SSO 用 SAML メタデータ URL"
  type        = string
  default     = ""
}

# --- Amazon Managed Prometheus (AMP) ---

resource "aws_prometheus_workspace" "main" {
  alias = "shared-platform-metrics-${var.environment}"

  tags = {
    Name        = "shared-platform-metrics-${var.environment}"
    Environment = var.environment
  }
}

# --- Amazon Managed Grafana (AMG) ---

resource "aws_grafana_workspace" "main" {
  name                     = "shared-platform-grafana-${var.environment}"
  account_access_type      = "CURRENT_ACCOUNT"
  authentication_providers = ["SAML"]
  permission_type          = "SERVICE_MANAGED"
  role_arn                 = aws_iam_role.grafana.arn

  data_sources = [
    "PROMETHEUS",
    "CLOUDWATCH",
    "XRAY",
  ]

  tags = {
    Name        = "shared-platform-grafana-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_grafana_workspace_saml_configuration" "main" {
  workspace_id = aws_grafana_workspace.main.id

  idp_metadata_url       = var.grafana_sso_saml_metadata # TODO: Entra ID SAML メタデータ URL を設定
  admin_role_values      = ["platform-admin"]
  editor_role_values     = ["platform-editor"]
  login_validity_duration = 480
}

# Grafana 用 IAM ロール
resource "aws_iam_role" "grafana" {
  name = "shared-platform-grafana-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "grafana.amazonaws.com"
        }
      }
    ]
  })
}

# Grafana から AMP への読み取りアクセス
resource "aws_iam_role_policy" "grafana_amp" {
  name = "grafana-amp-access"
  role = aws_iam_role.grafana.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "aps:QueryMetrics",
          "aps:GetSeries",
          "aps:GetLabels",
          "aps:GetMetricMetadata",
        ]
        Resource = aws_prometheus_workspace.main.arn
      }
    ]
  })
}

# Grafana から CloudWatch への読み取りアクセス
resource "aws_iam_role_policy_attachment" "grafana_cloudwatch" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess" # TODO: 最小権限のカスタムポリシーに変更
  role       = aws_iam_role.grafana.name
}

# Grafana から X-Ray への読み取りアクセス
resource "aws_iam_role_policy_attachment" "grafana_xray" {
  policy_arn = "arn:aws:iam::aws:policy/AWSXRayReadOnlyAccess"
  role       = aws_iam_role.grafana.name
}

# --- ADOT Collector ---

# ADOT Collector 用 Pod Identity
resource "aws_iam_role" "adot_collector" {
  name = "${var.cluster_name}-adot-collector"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = ["sts:AssumeRole", "sts:TagSession"]
        Effect = "Allow"
        Principal = {
          Service = "pods.eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "adot_collector" {
  name = "adot-collector-permissions"
  role = aws_iam_role.adot_collector.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "aps:RemoteWrite",
        ]
        Resource = aws_prometheus_workspace.main.arn
      },
      {
        Effect = "Allow"
        Action = [
          "xray:PutTraceSegments",
          "xray:PutTelemetryRecords",
          "xray:GetSamplingRules",
          "xray:GetSamplingTargets",
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
        ]
        Resource = "*" # TODO: ロググループ ARN で制限すること
      }
    ]
  })
}

resource "aws_eks_pod_identity_association" "adot_collector" {
  cluster_name    = var.cluster_name
  namespace       = "monitoring"
  service_account = "adot-collector"
  role_arn        = aws_iam_role.adot_collector.arn
}

# ADOT Collector Helm リリース
resource "helm_release" "adot_collector" {
  name       = "adot-collector"
  namespace  = "monitoring"
  repository = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart      = "opentelemetry-collector"
  version    = "0.90.0" # TODO: 最新安定バージョンに更新

  create_namespace = true

  values = [<<-YAML
    mode: daemonset
    serviceAccount:
      name: adot-collector
    config:
      receivers:
        otlp:
          protocols:
            grpc:
              endpoint: 0.0.0.0:4317
            http:
              endpoint: 0.0.0.0:4318
        prometheus:
          config:
            scrape_configs:
              - job_name: 'kubernetes-pods'
                kubernetes_sd_configs:
                  - role: pod
      exporters:
        awsprometheusremotewrite:
          endpoint: "${aws_prometheus_workspace.main.prometheus_endpoint}api/v1/remote_write"
          aws_auth:
            region: "ap-northeast-1"
            service: "aps"
        awsxray:
          region: "ap-northeast-1"
        awscloudwatchlogs:
          region: "ap-northeast-1"
          log_group_name: "/shared-platform/${var.environment}/otel"
          log_stream_name: "otel-collector"
      service:
        pipelines:
          metrics:
            receivers: [otlp, prometheus]
            exporters: [awsprometheusremotewrite]
          traces:
            receivers: [otlp]
            exporters: [awsxray]
          logs:
            receivers: [otlp]
            exporters: [awscloudwatchlogs]
  YAML
  ]
}

# --- 出力 ---

output "prometheus_workspace_id" {
  description = "AMP ワークスペース ID"
  value       = aws_prometheus_workspace.main.id
}

output "prometheus_endpoint" {
  description = "AMP エンドポイント"
  value       = aws_prometheus_workspace.main.prometheus_endpoint
}

output "grafana_workspace_url" {
  description = "AMG ワークスペース URL"
  value       = aws_grafana_workspace.main.endpoint
}
