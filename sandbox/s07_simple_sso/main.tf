# main.tf
#
# このファイルは、AWSリソースを定義するメインのTerraformコンフィギュレーションファイルです。
# ここでは、S3バケットを作成し、Terraformとプロバイダーの設定を行います。

terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# AWSプロバイダーの設定
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_session_token
}

# S3バケットの作成
resource "aws_s3_bucket" "test" {
  bucket_prefix = var.bucket_prefix
  tags          = var.tags
}

# 出力の定義
output "s3_bucket_name" {
  description = "作成されたS3バケットの名前"
  value       = aws_s3_bucket.test.id
}
