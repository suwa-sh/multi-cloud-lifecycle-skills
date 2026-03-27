# ArgoCD モジュール
# ArgoCD の Helm デプロイと AppProject テンプレートを構成する

variable "cluster_name" {
  description = "EKS クラスタ名"
  type        = string
}

variable "environment" {
  description = "デプロイ環境"
  type        = string
}

# --- ArgoCD Helm リリース ---

resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.3.0" # TODO: 最新安定バージョンに更新

  create_namespace = true

  values = [<<-YAML
    # HA モード設定
    controller:
      replicas: 2
    server:
      replicas: 2
      ingress:
        enabled: true
        ingressClassName: alb
        annotations:
          alb.ingress.kubernetes.io/scheme: internal
          alb.ingress.kubernetes.io/target-type: ip
          alb.ingress.kubernetes.io/certificate-arn: "" # TODO: ACM 証明書 ARN を設定
          alb.ingress.kubernetes.io/listen-ports: '[{"HTTPS":443}]'
          alb.ingress.kubernetes.io/ssl-redirect: "443"
        hosts:
          - argocd.internal.example.com # TODO: 内部ドメインを設定
    repoServer:
      replicas: 2
    applicationSet:
      replicas: 2
    configs:
      params:
        server.insecure: true # ALB で TLS 終端するため
      cm:
        admin.enabled: false
        dex.config: | # TODO: Entra ID SSO 設定を追加
          connectors: []
  YAML
  ]
}

# --- ArgoCD AppProject: プラットフォームチーム ---

resource "kubernetes_manifest" "appproject_platform" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "AppProject"
    metadata = {
      name      = "platform"
      namespace = "argocd"
    }
    spec = {
      description = "プラットフォームチーム用プロジェクト"
      sourceRepos = [
        "https://github.com/ORG/platform-manifests", # TODO: リポジトリ URL を設定
      ]
      destinations = [
        {
          server    = "https://kubernetes.default.svc"
          namespace = "kube-system"
        },
        {
          server    = "https://kubernetes.default.svc"
          namespace = "monitoring"
        },
        {
          server    = "https://kubernetes.default.svc"
          namespace = "argocd"
        },
        {
          server    = "https://kubernetes.default.svc"
          namespace = "external-secrets"
        },
      ]
      clusterResourceWhitelist = [
        {
          group = "*"
          kind  = "*"
        },
      ]
      orphanedResources = {
        warn = true
      }
    }
  }

  depends_on = [helm_release.argocd]
}

# --- ArgoCD AppProject テンプレート: テナント用 ---

resource "kubernetes_manifest" "appproject_tenant_template" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "AppProject"
    metadata = {
      name      = "tenant-template"
      namespace = "argocd"
      annotations = {
        "platform.example.com/description" = "テナント用 AppProject テンプレート。実際のテナントオンボーディング時にコピーして使用する。"
      }
    }
    spec = {
      description = "テナント用 AppProject テンプレート"
      sourceRepos = [] # TODO: テナントオンボーディング時にリポジトリ URL を設定
      destinations = [
        {
          server    = "https://kubernetes.default.svc"
          namespace = "TENANT_NAMESPACE" # TODO: テナント Namespace に置換
        },
      ]
      # テナントにはクラスタスコープリソースの作成を禁止
      clusterResourceWhitelist = []
      namespaceResourceWhitelist = [
        {
          group = ""
          kind  = "ConfigMap"
        },
        {
          group = ""
          kind  = "Secret"
        },
        {
          group = ""
          kind  = "Service"
        },
        {
          group = "apps"
          kind  = "Deployment"
        },
        {
          group = "apps"
          kind  = "StatefulSet"
        },
        {
          group = "batch"
          kind  = "Job"
        },
        {
          group = "batch"
          kind  = "CronJob"
        },
        {
          group = "networking.k8s.io"
          kind  = "Ingress"
        },
        {
          group = "autoscaling"
          kind  = "HorizontalPodAutoscaler"
        },
      ]
      orphanedResources = {
        warn = true
      }
      syncWindows = [
        {
          kind         = "deny"
          schedule     = "0 0-6 * * 1-5" # TODO: メンテナンスウィンドウを調整
          duration     = "6h"
          applications = ["*"]
          namespaces   = ["*"]
          manualSync   = true
        },
      ]
    }
  }

  depends_on = [helm_release.argocd]
}

# --- 出力 ---

output "argocd_namespace" {
  description = "ArgoCD Namespace"
  value       = "argocd"
}
