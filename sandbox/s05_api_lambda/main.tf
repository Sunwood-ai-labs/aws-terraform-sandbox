# main.tf
#
# このファイルは、AWSのLambdaでFastAPIを実行するための
# 主要なTerraform設定を含んでいます。
# 
# 含まれるリソース:
# - AWS Lambdaファンクション
# - API Gateway
# - IAMロール
# - CloudWatch Logsロググループ

# AWSプロバイダーの設定
provider "aws" {
  region = var.aws_region
}

# Lambda関数用のIAMロール
resource "aws_iam_role" "lambda_role" {
  name = "api_lambda_role"

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

# Lambda実行用のIAMロールポリシー
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# ローカルにあるLambdaのソースコード
data "archive_file" "test_terraform" {
  type        = "zip"
  source_dir  = "lambda/test/src"
  output_path = "lambda/test/src/test_terraform.zip"
}

# Lambda関数
resource "aws_lambda_function" "api_lambda" {
  filename         = data.archive_file.test_terraform.output_path
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = "test_terraform.handler"
  runtime          = "python3.9"
  source_code_hash = data.archive_file.test_terraform.output_base64sha256

  environment {
    variables = {
      STAGE = var.stage
    }
  }
}

# API Gateway
resource "aws_apigatewayv2_api" "lambda_api" {
  name          = "lambda-api"
  protocol_type = "HTTP"
  cors_configuration {
    allow_origins = ["*"]
    allow_methods = ["GET", "POST", "PUT", "DELETE"]
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
  integration_uri  = aws_lambda_function.api_lambda.invoke_arn
  integration_method = "POST"
  payload_format_version = "2.0"
}

# API Gatewayルート
resource "aws_apigatewayv2_route" "lambda_route" {
  api_id    = aws_apigatewayv2_api.lambda_api.id
  route_key = "GET /test"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

# CloudWatch Logsロググループ
resource "aws_cloudwatch_log_group" "api_gw" {
  name = "/aws/api_gw/${aws_apigatewayv2_api.lambda_api.name}"

  retention_in_days = 30
}

# Lambda関数のCloudWatch Logsロググループ
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.api_lambda.function_name}"
  retention_in_days = 30
}

# Lambda関数へのAPI Gateway呼び出し許可
resource "aws_lambda_permission" "api_gw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.lambda_api.execution_arn}/${var.stage}/GET/test"
}

# Outputs
output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.api_lambda.function_name
}

output "base_url" {
  description = "Base URL for API Gateway stage"
  value       = aws_apigatewayv2_stage.lambda_stage.invoke_url
}
