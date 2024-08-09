aws_region         = "ap-northeast-1"
project_name       = "streamlit-app"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
ami_id             = "ami-0d52744d6551d851e"  # Ubuntu 20.04 LTS in us-west-2
instance_type      = "t2.micro"
key_name           = "streamlit-terraform-keypair-tokyo-PEM"
