# terraform.tfvars

# このファイルは、Terraformプロジェクトの変数に具体的な値を設定するために使用されます。
# ここで設定された値は、variables.tfで定義されたデフォルト値をオーバーライドします。
# プロジェクト固有の設定や環境固有の値をここに記述します。
# 注意: 機密情報（APIキーなど）はこのファイルに直接記述せず、環境変数や
# 別の安全な方法で管理してください。

aws_region         = "ap-northeast-1"
project_name       = "my-docker-compose-project"
vpc_cidr           = "10.0.0.0/16"
private_subnet_cidr = "10.0.1.0/24"
ami_id             = "ami-0d52744d6551d851e"  # Ubuntu 20.04 LTS (HVM), SSD Volume Type
instance_type      = "t3.medium"  # 2 vCPU, 4 GiB Memory
key_name           = "streamlit-terraform-keypair-tokyo-PEM"  # AWSコンソールで作成したSSHキーペアの名前を指定してください
