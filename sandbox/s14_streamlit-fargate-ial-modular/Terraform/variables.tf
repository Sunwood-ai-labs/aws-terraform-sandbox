# variables.tf
# このファイルは、プロジェクト全体で使用される変数を定義します。

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-northeast-1"
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "nekoneko-app"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
  default     = ["ap-northeast-1a", "ap-northeast-1c"]
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "whitelist_ips" {
  description = "List of IP addresses allowed to access the ALB"
  type        = list(string)
  default     = []
}

variable "container_image" {
  description = "Container image to use"
  type        = string
  default     = "makisunwood/nekoneko-app:latest"
}

variable "container_port" {
  description = "Port of the container"
  type        = number
  default     = 8501
}

variable "desired_count" {
  description = "Default number of tasks for ECS service"
  type        = number
  default     = 2
}

variable "schedule_start_time" {
  description = "Start time of the service (cron format)"
  type        = string
  default     = "0 8 ? * MON-FRI *"
}

variable "schedule_stop_time" {
  description = "Stop time of the service (cron format)"
  type        = string
  default     = "0 19 ? * MON-FRI *"
}

# 以下の変数定義を追加

variable "task_cpu" {
  description = "CPU units for the task"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "Memory for the task"
  type        = string
  default     = "512"
}
