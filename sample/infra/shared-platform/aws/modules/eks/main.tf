# EKS クラスタモジュール
# EKS クラスタ、マネージドノードグループ、Karpenter、Pod Identity、コントロールプレーンログを構成する

variable "cluster_name" {
  description = "EKS クラスタ名"
  type        = string
}

variable "environment" {
  description = "デプロイ環境"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "サブネット ID リスト"
  type        = list(string)
}

variable "eks_version" {
  description = "Kubernetes バージョン"
  type        = string
  default     = "1.30"
}

# --- EKS クラスタ IAM ロール ---

resource "aws_iam_role" "eks_cluster" {
  name = "${var.cluster_name}-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.cluster_name}-cluster-role"
  }
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

resource "aws_iam_role_policy_attachment" "eks_vpc_resource_controller" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_cluster.name
}

# --- EKS クラスタ ---

resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  version  = var.eks_version
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = false # TODO: 初期構築時は true に変更し、構築完了後に false にすること
    security_group_ids      = [] # TODO: クラスタセキュリティグループ ID を設定
  }

  # コントロールプレーンログの全タイプを有効化
  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler",
  ]

  # EKS Pod Identity エージェントアドオン
  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  tags = {
    Name        = var.cluster_name
    Environment = var.environment
  }
}

# --- EKS アドオン ---

resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "vpc-cni"
  # TODO: バージョンを固定すること
}

resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "coredns"
  # TODO: バージョンを固定すること
  depends_on = [aws_eks_node_group.default]
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "kube-proxy"
  # TODO: バージョンを固定すること
}

resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "aws-ebs-csi-driver"
  # TODO: バージョンを固定すること
  # TODO: EBS CSI ドライバー用の Pod Identity を設定
}

resource "aws_eks_addon" "pod_identity_agent" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "eks-pod-identity-agent"
}

# --- マネージドノードグループ ---

resource "aws_iam_role" "node_group" {
  name = "${var.cluster_name}-node-group-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "node_worker_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node_group.name
}

resource "aws_iam_role_policy_attachment" "node_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node_group.name
}

resource "aws_iam_role_policy_attachment" "node_ecr_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node_group.name
}

resource "aws_eks_node_group" "default" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.cluster_name}-default"
  node_role_arn   = aws_iam_role.node_group.arn
  subnet_ids      = var.subnet_ids

  instance_types = ["m7i.xlarge"] # TODO: ワークロード要件に応じて調整
  ami_type       = "AL2023_x86_64_STANDARD"
  disk_size      = 100

  scaling_config {
    desired_size = 3  # TODO: 環境に応じて調整
    min_size     = 2
    max_size     = 10 # TODO: 環境に応じて調整
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name        = "${var.cluster_name}-default"
    Environment = var.environment
  }
}

# --- Karpenter ---

# Karpenter 用 IAM ロール
resource "aws_iam_role" "karpenter_controller" {
  name = "${var.cluster_name}-karpenter-controller"

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

# TODO: Karpenter 用 IAM ポリシーをアタッチすること

# Karpenter Pod Identity アソシエーション
resource "aws_eks_pod_identity_association" "karpenter" {
  cluster_name    = aws_eks_cluster.main.name
  namespace       = "kube-system"
  service_account = "karpenter"
  role_arn        = aws_iam_role.karpenter_controller.arn
}

# Karpenter Helm リリース
resource "helm_release" "karpenter" {
  name       = "karpenter"
  namespace  = "kube-system"
  repository = "oci://public.ecr.aws/karpenter"
  chart      = "karpenter"
  version    = "0.37.0" # TODO: 最新安定バージョンに更新

  set {
    name  = "settings.clusterName"
    value = aws_eks_cluster.main.name
  }

  set {
    name  = "settings.clusterEndpoint"
    value = aws_eks_cluster.main.endpoint
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.karpenter_controller.arn
  }

  depends_on = [
    aws_eks_node_group.default,
    aws_eks_pod_identity_association.karpenter,
  ]
}

# Karpenter NodePool（kubectl プロバイダーでカスタムリソースを適用）
resource "kubectl_manifest" "karpenter_node_pool" {
  yaml_body = <<-YAML
    apiVersion: karpenter.sh/v1beta1
    kind: NodePool
    metadata:
      name: default
    spec:
      template:
        spec:
          requirements:
            - key: karpenter.k8s.aws/instance-family
              operator: In
              values: ["m7i", "m7a", "c7i", "r7i"]
            - key: karpenter.sh/capacity-type
              operator: In
              values: ["on-demand", "spot"]
            - key: topology.kubernetes.io/zone
              operator: In
              values: ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
          nodeClassRef:
            name: default
      limits:
        cpu: "100"        # TODO: クラスタのキャパシティ上限を調整
        memory: "400Gi"   # TODO: クラスタのキャパシティ上限を調整
      disruption:
        consolidationPolicy: WhenUnderutilized
        expireAfter: 720h # TODO: ノードの最大存続時間を調整
  YAML

  depends_on = [helm_release.karpenter]
}

resource "kubectl_manifest" "karpenter_ec2_node_class" {
  yaml_body = <<-YAML
    apiVersion: karpenter.k8s.aws/v1beta1
    kind: EC2NodeClass
    metadata:
      name: default
    spec:
      amiFamily: AL2023
      subnetSelectorTerms:
        - tags:
            karpenter.sh/discovery: ${var.cluster_name}
      securityGroupSelectorTerms:
        - tags:
            karpenter.sh/discovery: ${var.cluster_name}
      role: ${aws_iam_role.node_group.name}
      blockDeviceMappings:
        - deviceName: /dev/xvda
          ebs:
            volumeSize: 100Gi     # TODO: ディスクサイズを調整
            volumeType: gp3
            encrypted: true
  YAML

  depends_on = [helm_release.karpenter]
}

# --- Pod Identity アソシエーション（共通サービス用） ---

resource "aws_iam_role" "aws_lb_controller" {
  name = "${var.cluster_name}-aws-lb-controller"

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

# TODO: AWS Load Balancer Controller 用 IAM ポリシーをアタッチすること

resource "aws_eks_pod_identity_association" "aws_lb_controller" {
  cluster_name    = aws_eks_cluster.main.name
  namespace       = "kube-system"
  service_account = "aws-load-balancer-controller"
  role_arn        = aws_iam_role.aws_lb_controller.arn
}

# --- 出力 ---

output "cluster_name" {
  description = "EKS クラスタ名"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "EKS クラスタエンドポイント"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_ca_certificate" {
  description = "EKS クラスタ CA 証明書（Base64 エンコード）"
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_security_group_id" {
  description = "EKS クラスタセキュリティグループ ID"
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}
