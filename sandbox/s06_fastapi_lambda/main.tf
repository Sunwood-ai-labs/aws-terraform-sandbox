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
resource "aws_ecr_repository" "fastapi_lambda_repo" {
  name = "fastapi-lambda-repo"
  force_delete = true
}

# Lambda 関数
resource "aws_lambda_function" "fastapi_lambda" {
  function_name = "fastapi-lambda-function"
  role          = aws_iam_role.lambda_role.arn
  package_type  = "Image"
  image_uri     = "${aws_ecr_repository.fastapi_lambda_repo.repository_url}:latest"

  environment {
    variables = {
      STAGE = "dev"
    }
  }
}

# API Gateway (REST API)
resource "aws_api_gateway_rest_api" "lambda_api" {
  name        = "fastapi-lambda-api"
  description = "FastAPI Lambda API"
}

# API Gateway リソース
resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.lambda_api.id
  parent_id   = aws_api_gateway_rest_api.lambda_api.root_resource_id
  path_part   = "{proxy+}"
}

# API Gateway メソッド (ANY)
resource "aws_api_gateway_method" "proxy_method" {
  rest_api_id   = aws_api_gateway_rest_api.lambda_api.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "ANY"
  authorization = "NONE"
}

# Lambda 関数の ARN を取得するデータソース
data "aws_lambda_function" "fastapi_lambda_function" {
  function_name = aws_lambda_function.fastapi_lambda.function_name
}

# Lambda関数のAPI Gateway呼び出し許可
resource "aws_lambda_permission" "api_gw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.fastapi_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.lambda_api.execution_arn}/*/*"
}

# API Gateway 統合
resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.lambda_api.id
  resource_id             = aws_api_gateway_resource.proxy.id
  http_method             = aws_api_gateway_method.proxy_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  # integration_uri         = aws_lambda_function.fastapi_lambda.invoke_arn
  uri                     = aws_lambda_function.fastapi_lambda.invoke_arn
}

# API Gateway デプロイ
resource "aws_api_gateway_deployment" "lambda_deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda_integration,
  ]
  rest_api_id = aws_api_gateway_rest_api.lambda_api.id
  stage_name  = var.stage
}

# CloudWatch Logs
resource "aws_cloudwatch_log_group" "api_gw" {
  name = "/aws/api_gw/${aws_api_gateway_rest_api.lambda_api.name}"
  retention_in_days = 30
}

# 出力
output "ecr_repository_url" {
  description = "ECR URL"
  value       = aws_ecr_repository.fastapi_lambda_repo.repository_url
}

output "lambda_function_name" {
  description = "Lambda f"
  value       = aws_lambda_function.fastapi_lambda.function_name
}

output "api_gateway_url" {
  description = "API Gateway URL"
  value       = aws_api_gateway_deployment.lambda_deployment.invoke_url
}
