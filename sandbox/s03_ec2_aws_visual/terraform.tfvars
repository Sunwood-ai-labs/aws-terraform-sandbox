# terraform.tfvars

# ファイルの概要:
# このファイルは、Terraformプロジェクトの変数に具体的な値を割り当てます。
# variables.tfで定義された変数のうち、デフォルト値を上書きしたいものや、
# プロジェクト固有の設定値を指定するために使用します。

# ファイルの意味:
# - プロジェクト固有の設定値を一元管理
# - 環境ごとの設定値の分離（このファイルを環境ごとに用意することで容易に切り替え可能）
# - バージョン管理システムでの追跡（機密情報を含まない場合）
# - チーム内での設定共有と標準化

aws_region         = "ap-northeast-1"
project_name       = "ec2_aws_visual"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
ami_id             = "ami-092957e65e64cc357"
instance_type      = "t2.micro"
key_name           = "streamlit-terraform-keypair-tokyo-PEM"  # あなたのSSHキーペア名に置き換えてください
