# AWS プロバイダーの設定
provider "aws" {
  region = "ap-northeast-1"
}

# Lambda 用の IAM ロール
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

# Lambda 実行用の IAM ポリシー
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# ECR リポジトリ
resource "aws_ecr_repository" "fastapi_repo" {
  name = "fastapi-lambda-repo"
  force_delete = true # この行を追加
}

# Lambda 関数
resource "aws_lambda_function" "fastapi_lambda" {
  function_name = "fastapi-lambda-function"
  role          = aws_iam_role.lambda_role.arn
  package_type  = "Image"
  image_uri     = "${aws_ecr_repository.fastapi_repo.repository_url}:latest"

  environment {
    variables = {
      STAGE = "dev"
    }
  }
}

# API Gateway
resource "aws_apigatewayv2_api" "lambda_api" {
  name          = "fastapi-lambda-api"
  protocol_type = "HTTP"
  cors_configuration {
    allow_origins = ["*"]
    allow_methods = ["GET", "POST", "PUT", "DELETE", "OPTIONS"]
    allow_headers = ["Content-Type", "Authorization"]
    max_age       = 300
  }
}

# API Gatewayステージ
resource "aws_apigatewayv2_stage" "lambda_stage" {
  api_id = aws_apigatewayv2_api.lambda_api.id
  name   = var.stage
  auto_deploy = true

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api_gw.arn

    format = jsonencode({
      requestId               = "$context.requestId"
      sourceIp                = "$context.identity.sourceIp"
      requestTime             = "$context.requestTime"
      protocol                = "$context.protocol"
      httpMethod              = "$context.httpMethod"
      resourcePath            = "$context.resourcePath"
      routeKey                = "$context.routeKey"
      status                  = "$context.status"
      responseLength          = "$context.responseLength"
      integrationErrorMessage = "$context.integrationErrorMessage"
      }
    )
  }
}

# API Gateway統合
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id           = aws_apigatewayv2_api.lambda_api.id
  integration_type = "AWS_PROXY"
  integration_uri  = aws_lambda_function.fastapi_lambda.invoke_arn
  integration_method = "POST"
  payload_format_version = "2.0"
}

# API Gatewayルート（すべてのパスとメソッドに対応）
resource "aws_apigatewayv2_route" "lambda_route" {
  api_id    = aws_apigatewayv2_api.lambda_api.id
  route_key = "ANY /{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

# CloudWatch Logs
resource "aws_cloudwatch_log_group" "api_gw" {
  name = "/aws/api_gw/${aws_apigatewayv2_api.lambda_api.name}"
  retention_in_days = 30
}

# Lambda関数のAPI Gateway呼び出し許可
resource "aws_lambda_permission" "api_gw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.fastapi_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.lambda_api.execution_arn}/*/*"
}

# 出力
output "ecr_repository_url" {
  description = "ECR URL"
  value       = aws_ecr_repository.fastapi_repo.repository_url
}

output "lambda_function_name" {
  description = "Lambda f"
  value       = aws_lambda_function.fastapi_lambda.function_name
}

output "api_gateway_url" {
  description = "API Gateway URL"
  value       = "${aws_apigatewayv2_stage.lambda_stage.invoke_url}"
}
