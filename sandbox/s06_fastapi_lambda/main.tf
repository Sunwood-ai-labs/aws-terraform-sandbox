# AWSプロバイダーの設定
provider "aws" {
  region = var.aws_region
}

# Lambda実行用のIAMロール
resource "aws_iam_role" "lambda_role" {
  name = "fastapi_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Lambda実行用のIAMポリシー
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# ECRリポジトリ
resource "aws_ecr_repository" "fastapi_lambda_repo" {
  name         = "fastapi-lambda-repo"
  force_delete = true
}

# Dockerイメージのビルドとプッシュを行うnull_resource
resource "null_resource" "docker_push" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      echo Building the Docker image
      echo ${var.aws_region}
      echo ${aws_ecr_repository.fastapi_lambda_repo.repository_url}
      
      echo Logging in to ECR
      aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${aws_ecr_repository.fastapi_lambda_repo.repository_url}
      
      echo Tagging the image
      docker tag fastapi-lambda:latest ${aws_ecr_repository.fastapi_lambda_repo.repository_url}:latest
      
      echo Pushing the image to ECR
      docker push ${aws_ecr_repository.fastapi_lambda_repo.repository_url}:latest
      Start-Sleep 10
    EOT

    interpreter = ["PowerShell", "-Command"]
  }

  depends_on = [aws_ecr_repository.fastapi_lambda_repo]
}

# Lambda関数
resource "aws_lambda_function" "fastapi_lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  package_type  = "Image"
  image_uri     = "${aws_ecr_repository.fastapi_lambda_repo.repository_url}:latest"

  environment {
    variables = {
      STAGE = var.stage
    }
  }
  depends_on = [null_resource.docker_push]
}

# API Gateway (REST API)
resource "aws_api_gateway_rest_api" "lambda_api" {
  name        = "fastapi-lambda-api"
  description = "FastAPI Lambda API"
}

# API Gatewayリソース
resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.lambda_api.id
  parent_id   = aws_api_gateway_rest_api.lambda_api.root_resource_id
  path_part   = "{proxy+}"
}

# API Gatewayメソッド (ANY)
resource "aws_api_gateway_method" "proxy_method" {
  rest_api_id      = aws_api_gateway_rest_api.lambda_api.id
  resource_id      = aws_api_gateway_resource.proxy.id
  http_method      = "ANY"
  authorization    = "NONE"
  api_key_required = true
}

# Lambda関数のAPI Gateway呼び出し許可
resource "aws_lambda_permission" "api_gw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.fastapi_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.lambda_api.execution_arn}/*/*"
}

# API Gateway統合
resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.lambda_api.id
  resource_id             = aws_api_gateway_resource.proxy.id
  http_method             = aws_api_gateway_method.proxy_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.fastapi_lambda.invoke_arn
}

# API Gatewayデプロイ
resource "aws_api_gateway_deployment" "lambda_deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda_integration,
  ]
  rest_api_id = aws_api_gateway_rest_api.lambda_api.id
  stage_name  = var.stage
}

# CloudWatch Logs
resource "aws_cloudwatch_log_group" "api_gw" {
  name              = "/aws/api_gw/${aws_api_gateway_rest_api.lambda_api.name}"
  retention_in_days = 30
}

# APIキーの作成
resource "aws_api_gateway_api_key" "fastapi_lambda_api_key" {
  name = "fastapi-lambda-api-key"
}

# 使用量プランの作成
resource "aws_api_gateway_usage_plan" "fastapi_lambda_usage_plan" {
  name        = "fastapi-lambda-usage-plan"
  description = "Usage plan for FastAPI Lambda API"

  api_stages {
    api_id = aws_api_gateway_rest_api.lambda_api.id
    stage  = aws_api_gateway_deployment.lambda_deployment.stage_name
  }

  quota_settings {
    limit  = 1000
    offset = 0
    period = "MONTH"
  }

  throttle_settings {
    burst_limit = 5
    rate_limit  = 10
  }
}

# 使用量プランとAPIキーの関連付け
resource "aws_api_gateway_usage_plan_key" "fastapi_lambda_usage_plan_key" {
  key_id        = aws_api_gateway_api_key.fastapi_lambda_api_key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.fastapi_lambda_usage_plan.id
}

# 出力
output "ecr_repository_url" {
  description = "ECR URL"
  value       = aws_ecr_repository.fastapi_lambda_repo.repository_url
}

output "lambda_function_name" {
  description = "Lambda関数名"
  value       = aws_lambda_function.fastapi_lambda.function_name
}

output "api_gateway_url" {
  description = "API Gateway URL"
  value       = aws_api_gateway_deployment.lambda_deployment.invoke_url
}

output "fastapi_lambda_api_key" {
  description = "FastAPI Lambda APIキー"
  value       = aws_api_gateway_api_key.fastapi_lambda_api_key.value
  sensitive   = true
}
