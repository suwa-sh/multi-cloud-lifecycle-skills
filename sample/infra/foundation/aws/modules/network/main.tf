# =============================================================================
# ネットワークモジュール
# Transit Gateway、VPC、NAT Gateway、VPC Flow Logs
# =============================================================================

variable "org_prefix" {
  description = "組織リソースの命名プレフィックス"
  type        = string
}

# -----------------------------------------------------------------------------
# Transit Gateway
# -----------------------------------------------------------------------------

resource "aws_ec2_transit_gateway" "this" {
  description = "${var.org_prefix} 組織トランジットゲートウェイ"

  amazon_side_asn                 = 64512 # TODO: ASN を要件に合わせて設定すること
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  dns_support                     = "enable"

  tags = {
    Name = "${var.org_prefix}-tgw"
  }
}

# -----------------------------------------------------------------------------
# Transit Gateway ルートテーブル
# -----------------------------------------------------------------------------

resource "aws_ec2_transit_gateway_route_table" "production" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name = "${var.org_prefix}-tgw-rt-production"
  }
}

resource "aws_ec2_transit_gateway_route_table" "non_production" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name = "${var.org_prefix}-tgw-rt-non-production"
  }
}

resource "aws_ec2_transit_gateway_route_table" "shared_services" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name = "${var.org_prefix}-tgw-rt-shared-services"
  }
}

# -----------------------------------------------------------------------------
# 共有サービス VPC
# -----------------------------------------------------------------------------

resource "aws_vpc" "shared_services" {
  cidr_block           = "10.0.0.0/16" # TODO: CIDR を IP アドレス計画に合わせて調整すること
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.org_prefix}-shared-services-vpc"
  }
}

# TODO: AZ 構成をリージョンに合わせて調整すること
locals {
  azs = ["ap-northeast-1a", "ap-northeast-1c"]
}

resource "aws_subnet" "shared_private" {
  count = length(local.azs)

  vpc_id            = aws_vpc.shared_services.id
  cidr_block        = cidrsubnet(aws_vpc.shared_services.cidr_block, 8, count.index)
  availability_zone = local.azs[count.index]

  tags = {
    Name = "${var.org_prefix}-shared-private-${local.azs[count.index]}"
    Tier = "private"
  }
}

resource "aws_subnet" "shared_public" {
  count = length(local.azs)

  vpc_id            = aws_vpc.shared_services.id
  cidr_block        = cidrsubnet(aws_vpc.shared_services.cidr_block, 8, count.index + 100)
  availability_zone = local.azs[count.index]

  tags = {
    Name = "${var.org_prefix}-shared-public-${local.azs[count.index]}"
    Tier = "public"
  }
}

# -----------------------------------------------------------------------------
# インターネットゲートウェイ
# -----------------------------------------------------------------------------

resource "aws_internet_gateway" "shared" {
  vpc_id = aws_vpc.shared_services.id

  tags = {
    Name = "${var.org_prefix}-shared-igw"
  }
}

# -----------------------------------------------------------------------------
# NAT Gateway（2 AZ 冗長構成）
# -----------------------------------------------------------------------------

resource "aws_eip" "nat" {
  count  = length(local.azs)
  domain = "vpc"

  tags = {
    Name = "${var.org_prefix}-nat-eip-${local.azs[count.index]}"
  }
}

resource "aws_nat_gateway" "shared" {
  count = length(local.azs)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.shared_public[count.index].id

  tags = {
    Name = "${var.org_prefix}-nat-${local.azs[count.index]}"
  }

  depends_on = [aws_internet_gateway.shared]
}

# -----------------------------------------------------------------------------
# ルートテーブル
# -----------------------------------------------------------------------------

resource "aws_route_table" "shared_private" {
  count  = length(local.azs)
  vpc_id = aws_vpc.shared_services.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.shared[count.index].id
  }

  tags = {
    Name = "${var.org_prefix}-shared-private-rt-${local.azs[count.index]}"
  }
}

resource "aws_route_table_association" "shared_private" {
  count = length(local.azs)

  subnet_id      = aws_subnet.shared_private[count.index].id
  route_table_id = aws_route_table.shared_private[count.index].id
}

resource "aws_route_table" "shared_public" {
  vpc_id = aws_vpc.shared_services.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.shared.id
  }

  tags = {
    Name = "${var.org_prefix}-shared-public-rt"
  }
}

resource "aws_route_table_association" "shared_public" {
  count = length(local.azs)

  subnet_id      = aws_subnet.shared_public[count.index].id
  route_table_id = aws_route_table.shared_public.id
}

# -----------------------------------------------------------------------------
# VPC Flow Logs
# -----------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name              = "/aws/vpc/flow-logs/${var.org_prefix}-shared-services"
  retention_in_days = 90 # TODO: ログ保持期間を要件に合わせて調整すること
}

resource "aws_iam_role" "vpc_flow_logs" {
  name = "${var.org_prefix}-vpc-flow-logs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "vpc-flow-logs.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "vpc_flow_logs" {
  name = "vpc-flow-logs"
  role = aws_iam_role.vpc_flow_logs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_flow_log" "shared_services" {
  vpc_id               = aws_vpc.shared_services.id
  traffic_type         = "ALL"
  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.vpc_flow_logs.arn
  iam_role_arn         = aws_iam_role.vpc_flow_logs.arn

  tags = {
    Name = "${var.org_prefix}-shared-services-flow-log"
  }
}

# -----------------------------------------------------------------------------
# Transit Gateway アタッチメント
# -----------------------------------------------------------------------------

resource "aws_ec2_transit_gateway_vpc_attachment" "shared_services" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = aws_vpc.shared_services.id
  subnet_ids         = aws_subnet.shared_private[*].id

  tags = {
    Name = "${var.org_prefix}-shared-services-tgw-attachment"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "shared_services" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.shared_services.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.shared_services.id
}
