# variables.tf
#
# このファイルは、Terraformプロジェクトで使用される変数を定義します。
# これらの変数は、main.tfで参照され、実際の値はterraform.tfvarsで設定されます。

variable "aws_region" {
  description = "AWSリージョン"
  type        = string
  default     = "ap-northeast-1"
}

variable "lambda_function_name" {
  description = "Lambda関数の名前"
  type        = string
  default     = "fastapi-lambda-function"
}

variable "stage" {
  description = "デプロイメントステージ（例: dev, prod）"
  type        = string
  default     = "dev"
}
