variable "aws_region" {
  description = "デプロイするAWSリージョン"
  type        = string
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "プロジェクト名"
  type        = string
  default     = "streamlit-app"
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type        = string
  default     = "10.0.0.0/16"
}

variable "container_image" {
  description = "デプロイするコンテナイメージ"
  type        = string
}

variable "task_cpu" {
  description = "タスクのCPU単位"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "タスクのメモリ（MiB）"
  type        = string
  default     = "512"
}

variable "app_count" {
  description = "実行するアプリケーションの数"
  type        = number
  default     = 1
}
