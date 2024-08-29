![Architecture Diagram](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE_03.png)

# 🐳 s09-ec2-docker-moa: EC2インスタンスでのDocker環境構築とMOAのデプロイ

このサンドボックス環境は、AWSのEC2インスタンス上にDockerとDocker Composeを自動的にインストールし、[MOA（Magic of AWS）](https://github.com/Sunwood-ai-labs/moa)プロジェクトをデプロイするための設定を提供します。

## 🎯 プロジェクトの目的

- Terraformを使用してAWS上にセキュアなEC2環境を構築する
- EC2インスタンス上にDockerとDocker Composeを自動的にインストールする
- パブリックサブネットとNAT Gatewayを使用してセキュアな環境を構築する
- Systems Manager (SSM)を使用してEC2インスタンスにアクセスする
- [MOA（Magic of AWS）](https://github.com/Sunwood-ai-labs/moa)を自動的にデプロイし、Ollamaを使用して実行する

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
   cd s09-ec2-docker-moa
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

## 📁 ファイル構造

- `main.tf`: Terraformのメイン設定ファイル
- `variables.tf`: 変数定義ファイル
- `terraform.tfvars`: 変数値設定ファイル（gitignoreに含まれています）
- `setup_script.sh`: EC2インスタンス上で実行されるセットアップスクリプト
- `README.md`: このファイル

## 🖥️ 使用方法

1. EC2インスタンスの作成:
   ```bash
   terraform apply
   ```

2. Systems Manager (SSM)を使用してEC2インスタンスに接続:
   AWS Management ConsoleからSystems Manager > Session Managerを開き、作成されたインスタンスに接続します。

3. Dockerの動作確認:
   ```bash
   docker --version
   docker-compose --version
   ```

4. MOAプロジェクトの状態確認:
   ```bash
   cd /home/ubuntu/moa
   docker-compose -f docker-compose.ollama.yml ps
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

## 🔒 セキュリティ考慮事項

- EC2インスタンスはパブリックサブネットに配置されていますが、セキュリティグループで制限されたアクセスのみが許可されています。
- Systems Manager (SSM)を使用してEC2インスタンスにアクセスするため、SSHポートを開放する必要がありません。
- セキュリティグループは特定のポート（80, 443, 8181）のみを許可しています。
- IAMロールとポリシーを使用して、EC2インスタンスに必要最小限の権限のみを付与しています。

## 🤝 貢献

バグの報告や機能の提案は、GitHubのIssueを通じて行ってください。プルリクエストも歓迎します！

## 📚 参考リソース

- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [AWS EC2 User Guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)
- [Docker Documentation](https://docs.docker.com/)
- [AWS Systems Manager User Guide](https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html)
- [MOA(Magic of AWS ) Project Repository](https://github.com/Sunwood-ai-labs/moa)
