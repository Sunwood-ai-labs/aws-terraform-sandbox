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

# ECS用セキュリティグループのID
variable "ecs_sg_id" {
  description = "ID of the ECS security group"
  type        = string
}

# ALBターゲットグループのARN
variable "alb_target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string
}

# 使用するコンテナイメージ
variable "container_image" {
  description = "Container image to use"
  type        = string
}

# コンテナのポート
variable "container_port" {
  description = "Port of the container"
  type        = number
}

# ECSサービスのデフォルトのタスク数
variable "desired_count" {
  description = "Default number of tasks for ECS service"
  type        = number
}

# タスクのCPU
variable "task_cpu" {
  description = "CPU units for the task"
  type        = string
}

# タスクのメモリ
variable "task_memory" {
  description = "Memory for the task"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}
