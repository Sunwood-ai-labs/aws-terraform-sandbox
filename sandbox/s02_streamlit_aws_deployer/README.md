![](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE.png)

# 🚀 Terraform を使用した AWS 上の Streamlit アプリデプロイヤー

Terraform を使用して AWS 上で Streamlit アプリケーションのデプロイと管理を自動化します。

## ✨ 特徴

- 🕒 自動スケジューリング：平日の朝 8 時に起動し、正午に停止
- 🔒 AWS Systems Manager Session Manager を介したセキュアなリモートアクセス
- 🛠 カスタマイズ可能な設定（プロジェクト名、リージョン、インスタンスタイプなど）
- 🌐 包括的なネットワークセットアップ（VPC、サブネット、インターネットゲートウェイ、ルートテーブル）

## 🚦 クイックスタート

1. リポジトリをクローン
2. プロジェクトディレクトリに移動：`cd s02_streamlit_aws_deployer`
3. Terraform を初期化：`terraform init`
4. プランを確認：`terraform plan`
5. リソースをデプロイ：`terraform apply`

## ⚙️ 設定

`terraform.tfvars` をカスタマイズ：

```hcl
aws_region         = "ap-northeast-1"
project_name       = "streamlit-app"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
ami_id             = "ami-0d52744d6551d851e"
instance_type      = "t2.micro"
key_name           = "あなたのキーペア名"
```

## 🖥 リモートアクセス

- Session Manager 経由：SSH を設定し、`ssh -i "path/to/your/key.pem" ubuntu@i-1234567890abcdef0` を使用
- 直接 SSH（Elastic IP 使用時）：`ssh -i "path/to/your/key.pem" ubuntu@<Elastic_IP>`

## ⚠️ 重要な注意点

- 💰 コスト管理：使用していないリソースは `terraform destroy` で削除
- 🛡 本番環境ではセキュリティを強化
- 🔧 必要に応じて `variables.tf` と `terraform.tfvars` でカスタマイズ
