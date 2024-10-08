# アプリケーション名
variable "app_name" {
  description = "Name of the application"
  type        = string
}

# ECSクラスターの名前
variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

# ECSタスク定義のARN
variable "ecs_task_definition_arn" {
  description = "ARN of the ECS task definition"
  type        = string
}

# サービス開始時刻（cron形式）
variable "schedule_start_time" {
  description = "Start time of the service (cron format)"
  type        = string
}

# サービス停止時刻（cron形式）
variable "schedule_stop_time" {
  description = "Stop time of the service (cron format)"
  type        = string
}

# ECSサービスのデフォルトのタスク数
variable "desired_count" {
  description = "Default number of tasks for ECS service"
  type        = number
}
