resource "aws_cloudwatch_event_rule" "start_rule" {
  name                = "${var.app_name}-start-rule"
  description         = "Start ECS tasks"
  schedule_expression = var.schedule_start_time
}

resource "aws_cloudwatch_event_rule" "stop_rule" {
  name                = "${var.app_name}-stop-rule"
  description         = "Stop ECS tasks"
  schedule_expression = var.schedule_stop_time
}

resource "aws_cloudwatch_event_target" "start_target" {
  rule      = aws_cloudwatch_event_rule.start_rule.name
  target_id = "StartECSService"
  arn       = "arn:aws:ecs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:cluster/${var.ecs_cluster_name}"
  role_arn  = aws_iam_role.cloudwatch_role.arn

  ecs_target {
    task_count          = var.desired_count
    task_definition_arn = var.ecs_task_definition_arn
  }
}

resource "aws_cloudwatch_event_target" "stop_target" {
  rule      = aws_cloudwatch_event_rule.stop_rule.name
  target_id = "StopECSService"
  arn       = "arn:aws:ecs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:cluster/${var.ecs_cluster_name}"
  role_arn  = aws_iam_role.cloudwatch_role.arn

  ecs_target {
    task_count          = 1
    task_definition_arn = var.ecs_task_definition_arn
  }
}

resource "aws_iam_role" "cloudwatch_role" {
  name = "${var.app_name}-cloudwatch-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "events.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "cloudwatch_policy" {
  role       = aws_iam_role.cloudwatch_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceEventsRole"
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
