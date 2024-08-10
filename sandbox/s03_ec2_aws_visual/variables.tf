# variables.tf

# ファイルの概要:
# このファイルは、Terraformプロジェクトで使用される変数を定義します。
# EC2インスタンス、VPC、サブネットなどの設定に必要なパラメータが含まれています。

# ファイルの意味:
# - プロジェクト全体で使用される変数の中央管理
# - コードの再利用性と柔軟性の向上
# - 環境ごとの設定の容易化（開発、テスト、本番など）
# - セキュリティの向上（機密情報を直接コードに記述しない）

variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "my-ec2-project"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (HVM), SSD Volume Type
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}
