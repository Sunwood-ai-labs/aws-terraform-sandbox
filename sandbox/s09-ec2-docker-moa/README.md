![Architecture Diagram](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE_03.png)

# 🐳 s08_ec2_docker: EC2インスタンスでのDocker環境構築

このサンドボックス環境は、AWSのEC2インスタンス上にDockerとDocker Composeを自動的にインストールし、プライベートサブネット内でセキュアに運用するための設定を提供します。

## 🎯 プロジェクトの目的

- Terraformを使用してAWS上にセキュアなEC2環境を構築する方法を学ぶ
- EC2インスタンス上にDockerとDocker Composeを自動的にインストールする
- プライベートサブネットとNAT Gatewayを使用してセキュアな環境を構築する
- Systems Manager (SSM)を使用してEC2インスタンスにアクセスする方法を理解する

## 🚀 セットアップ手順

1. 必要な依存関係をインストールします：
   - Terraform
   - AWS CLI

2. AWS CLIの設定を行います：
   ```bash
   aws configure
   ```

3. このディレクトリに移動します：
   ```bash
   cd s08_ec2_docker
   ```

4. `terraform.tfvars.example` を `terraform.tfvars` にコピーし、必要な値を設定します：
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

5. Terraformの初期化を行います：
   ```bash
   terraform init
   ```

6. Terraformプランを確認します：
   ```bash
   terraform plan
   ```

7. インフラストラクチャをデプロイします：
   ```bash
   terraform apply
   ```

## 便利コマンド

```bash
terraform destroy -auto-approve & terraform init & terraform apply -auto-approve
```

sudo docker-compose -f docker-compose.ollama.yml up

## 📁 ファイル構造

- `main.tf`: Terraformのメイン設定ファイル
- `variables.tf`: 変数定義ファイル
- `terraform.tfvars`: 変数値設定ファイル（gitignoreに含まれています）
- `README.md`: このファイル

## 🖥️ 使用方法

1. EC2インスタンスの作成:
   ```bash
   terraform apply
   ```

2. Systems Manager (SSM)を使用してEC2インスタンスに接続:
   AWS Management ConsoleからSystems Manager > Session Managerを開き、作成されたインスタンスに接続します。

3. SSHを使用してEC2インスタンスに接続 (オプション):
   ```bash
   ssh -i "C:\Users\makim\.ssh\streamlit-terraform-keypair-tokyo-PEM.pem" ubuntu@i-0f9cd7c06ab7abeea
   ```
   注意: このコマンドを使用する場合は、インスタンスIDとキーペアのパスを適切に変更してください。また、セキュリティグループでSSHポート（22）を開放する必要があります。

4. Dockerの動作確認:
   ```bash
   docker --version
   docker-compose --version
   ```

5. リソースの削除:
   ```bash
   terraform destroy
   ```

## 🛠️ カスタマイズ

`terraform.tfvars` ファイルを編集することで、以下の設定をカスタマイズできます：

- `aws_region`: デプロイするAWSリージョン
- `project_name`: プロジェクト名（リソースの命名に使用）
- `vpc_cidr`: VPCのCIDRブロック
- `private_subnet_cidr`: プライベートサブネットのCIDRブロック
- `public_subnet_cidr`: パブリックサブネットのCIDRブロック
- `ami_id`: 使用するAMI ID
- `instance_type`: EC2インスタンスタイプ
- `key_name`: 使用するSSHキーペア名

## 📝 注意事項

- このプロジェクトは学習と実験を目的としています。本番環境での使用には適していません。
- AWSリソースの使用には料金が発生する可能性があります。使用後は必ずリソースを削除してください。
- `terraform.tfvars` ファイルには機密情報が含まれる可能性があるため、バージョン管理システムにコミットしないでください。
- SSHを使用してEC2インスタンスに接続する場合は、セキュリティリスクを考慮し、必要な場合のみ使用してください。

## 🔒 セキュリティ考慮事項

- EC2インスタンスはプライベートサブネットに配置され、直接のインターネットアクセスはありません。
- NAT Gatewayを通じて、EC2インスタンスからのアウトバウンドインターネットアクセスが可能です。
- Systems Manager (SSM)を使用してEC2インスタンスにアクセスするため、SSHポートを開放する必要がありません。
- セキュリティグループは443ポートのみを許可し、VPC内からのアクセスに制限しています。
- SSHアクセスを許可する場合は、セキュリティグループの設定を慎重に行い、必要最小限のIPアドレスからのアクセスのみを許可してください。

## 🤝 貢献

バグの報告や機能の提案は、GitHubのIssueを通じて行ってください。プルリクエストも歓迎します！

## 📚 参考リソース

- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [AWS EC2 User Guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)
- [Docker Documentation](https://docs.docker.com/)
- [AWS Systems Manager User Guide](https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html)
