# プロバイダーの設定
provider "aws" {
  region = "ap-northeast-1"  # 東京リージョン
}

# VPCの作成
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "streamlit-vpc"
  }
}

# パブリックサブネットの作成
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "streamlit-subnet"
  }
}

# インターネットゲートウェイの作成
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "streamlit-igw"
  }
}

# ルートテーブルの作成
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "streamlit-rt"
  }
}

# サブネットとルートテーブルの関連付け
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# セキュリティグループの作成
resource "aws_security_group" "streamlit" {
  name        = "streamlit-sg"
  description = "Security group for Streamlit server"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8501
    to_port     = 8501
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2インスタンスの作成
resource "aws_instance" "streamlit" {
  ami           = "ami-0d52744d6551d851e"  # Ubuntu 22.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"
  key_name      = "streamlit-terraform-keypair-tokyo"
  vpc_security_group_ids = [aws_security_group.streamlit.id]
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "streamlit-server"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y python3-pip
              pip3 install streamlit

              # Create a simple Streamlit app
              cat <<EOT > /home/ubuntu/app.py
              import streamlit as st

              st.title('Simple Streamlit App')
              name = st.text_input('Enter your name')
              if name:
                  st.write(f'Hello, {name}!')
              
              number = st.slider('Select a number', 0, 100)
              st.write(f'You selected: {number}')
              EOT

              # Run the Streamlit app
              nohup streamlit run /home/ubuntu/app.py --server.port 8501 --server.address 0.0.0.0 &
              EOF
}

# Elastic IPの割り当て
resource "aws_eip" "streamlit" {
  instance = aws_instance.streamlit.id
  domain   = "vpc"
}

# 出力
output "public_ip" {
  value = aws_eip.streamlit.public_ip
}
