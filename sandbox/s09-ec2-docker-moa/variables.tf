# variables.tf

# このファイルは、Terraformプロジェクトで使用される変数を定義します。
# 各変数にはデフォルト値が設定されていますが、terraform.tfvarsファイルや
# コマンドライン引数でオーバーライドすることができます。

variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "Name of the project, used as a prefix for all resources"
  type        = string
  default     = "docker-compose-project"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0d52744d6551d851e"  # Ubuntu 20.04 LTS (HVM), SSD Volume Type
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

# 変数の追加 (variables.tf に追加)
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.2.0/24"  # この値は適宜調整してください
}
