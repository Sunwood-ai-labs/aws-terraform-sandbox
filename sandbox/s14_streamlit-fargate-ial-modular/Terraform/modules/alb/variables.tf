# アプリケーション名
variable "app_name" {
  description = "Name of the application"
  type        = string
}

# VPCのID
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

# パブリックサブネットのID
variable "public_subnet_ids" {
  description = "IDs of public subnets"
  type        = list(string)
}

# ALB用セキュリティグループのID
variable "alb_sg_id" {
  description = "ID of the ALB security group"
  type        = string
}

# コンテナのポート
variable "container_port" {
  description = "Port of the container"
  type        = number
}

# ヘルスチェックのパス
variable "health_check_path" {
  description = "Path for health check"
  type        = string
  default     = "/"
}
