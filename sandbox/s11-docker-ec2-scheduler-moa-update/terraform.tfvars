aws_region         = "ap-northeast-1"
project_name       = "docker-ec2-scheduler"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr  = "10.0.2.0/24"
ami_id             = "ami-0d52744d6551d851e"  # Ubuntu 20.04 LTS (HVM), SSD Volume Type
instance_type      = "t3.medium"  # 2 vCPU, 4 GiB Memory
key_name           = "streamlit-terraform-keypair-tokyo-PEM"  # AWSコンソール
