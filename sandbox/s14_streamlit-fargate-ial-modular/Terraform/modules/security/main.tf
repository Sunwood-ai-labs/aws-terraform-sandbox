# CSVファイルからホワイトリストIPを読み込む
data "local_file" "whitelist" {
  filename = "${path.module}/../../data/whitelist.csv"
}

locals {
  whitelist_ips = [
    for row in csvdecode(data.local_file.whitelist.content) :
    row.ip
  ]
}

# ALB用セキュリティグループ
resource "aws_security_group" "alb" {
  name        = "${var.app_name}-alb-sg"
  description = "Security group for ALB"
  vpc_id      = var.vpc_id

  # CSVファイルから読み込んだIPアドレスに対するインバウンドルール
  dynamic "ingress" {
    for_each = local.whitelist_ips
    content {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
      description = "Access from whitelisted IP: ${ingress.value}"
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-alb-sg"
  }
}

# ECS用セキュリティグループ
resource "aws_security_group" "ecs" {
  name        = "${var.app_name}-ecs-sg"
  description = "Security group for ECS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.container_port
    to_port         = var.container_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-ecs-sg"
  }
}
