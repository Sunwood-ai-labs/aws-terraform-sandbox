# variables.tf
#
# このファイルは、Terraformプロジェクトで使用される変数を定義します。
# これらの変数は、main.tfファイルで参照され、terraform.tfvarsファイルで値が設定されます。

variable "aws_region" {
  description = "使用するAWSリージョン"
  type        = string
  default     = "ap-northeast-1"
}

variable "aws_access_key" {
  description = "AWS アクセスキー"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS シークレットキー"
  type        = string
}

variable "aws_session_token" {
  description = "AWS セッショントークン"
  type        = string
}

variable "bucket_prefix" {
  description = "作成するS3バケットの名前のプレフィックス"
  type        = string
  default     = "ssotest-"
}

variable "tags" {
  description = "リソースに適用するタグ"
  type        = map(string)
  default     = {
    Environment = "Development"
    Project     = "S3-SSO-Access"
  }
}
