![Architecture Diagram](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE_03.png)

# 🚀 s10-docker-ec2-scheduler-moa: MOAデプロイメント用AWS EC2スケジューラー

このプロジェクトは、Terraformを使用してAWS EC2インスタンス上にMOA（Magic of AWS）を自動的にデプロイし、スケジュールされた開始・停止時間を設定します。

## 🎯 プロジェクトの目的

- Terraformを使用してAWS EC2インスタンス上にMOAをデプロイする
- EC2インスタンスを自動的に開始・停止するスケジューラーを実装する
- AWSサービスとLLMを使用するための安全で独立した環境を提供する
- AWS BedrockやCloud AIサービスを簡単に試せるようにする

## 🌟 主な特徴

- DockerとMOAがプリインストールされたEC2インスタンスの自動デプロイ
- コスト最適化のためのスケジュール設定（開始：日本時間午前8時、日〜木曜日、停止：日本時間午後4時、月〜金曜日）
- VPC、サブネット、セキュリティグループを使用した安全なネットワーク設定
- EC2インスタンスとEventBridge用のIAMロールとポリシー
- AWS Systems Managerとの統合によるインスタンス管理の簡素化

## 📁 プロジェクト構造

```
s10-docker-ec2-scheduler-moa/
├─ modules/
│  ├─ compute/
│  ├─ iam/
│  ├─ networking/
├─ scripts/
│  ├─ setup_script.sh
├─ main.tf
├─ variables.tf
├─ outputs.tf
├─ providers.tf
├─ terraform.tfvars
├─ README.md
```

## 🚀 はじめ方

### 前提条件

- AWSアカウント
- Terraformがインストールされていること
- AWS CLIが設定されていること

### デプロイ手順

1. リポジトリをクローンします：
   ```
   git clone https://github.com/your-repo/s10-docker-ec2-scheduler-moa.git
   cd s10-docker-ec2-scheduler-moa
   ```

2. `terraform.tfvars` ファイルを特定の値で更新します：
   ```
   aws_region         = "ap-northeast-1"
   project_name       = "docker-ec2-scheduler"
   vpc_cidr           = "10.0.0.0/16"
   public_subnet_cidr = "10.0.2.0/24"
   ami_id             = "ami-0d52744d6551d851e"
   instance_type      = "t3.medium"
   key_name           = "your-key-pair-name"
   ```

3. Terraformを初期化します：
   ```
   terraform init
   ```

4. Terraformプランを確認します：
   ```
   terraform plan
   ```

5. Terraformの設定を適用します：
   ```
   terraform apply
   ```

6. プロンプトが表示されたら、変更を確認するために `yes` と入力します。

## 📊 MOAの特徴

MOA（Magic of AWS）は以下の機能を提供します：

- AWS BedrockやAWS Cloud AIサービスを簡単に試すことができます
- LiteLLMプロジェクトを使用して、様々なLLMモデルを統一されたインターフェースで利用できます
- Ollama WebUIを使用して、カスタムLLMモデルをチャットボットとしてデプロイできます
- AI開発のための安全で独立した環境を提供します

## 🔐 セキュリティ考慮事項

- EC2インスタンスはパブリックサブネットにデプロイされますが、セキュリティグループによってアクセスが制限されています
- IAMロールとポリシーを使用して、最小限の必要な権限のみを付与しています
- AWS Systems Managerを使用してインスタンス管理を行い、直接のSSHアクセスの必要性を減らしています

## 📝 カスタマイズ

以下のファイルを修正することでプロジェクトをカスタマイズできます：

- `terraform.tfvars`: 変数の値を更新します
- `modules/compute/main.tf`: EC2インスタンスの設定とスケジューリングを調整します
- `modules/networking/main.tf`: VPCとセキュリティグループの設定を変更します
- `scripts/setup_script.sh`: EC2インスタンスのセットアッププロセスをカスタマイズします

## 🧹 クリーンアップ

作成したすべてのリソースを削除するには：

```
terraform destroy
```

プロンプトが表示されたら、削除を確認するために `yes` と入力します。

## 🤝 貢献

貢献を歓迎します！お気軽にPull Requestを提出してください。

## 📜 ライセンス

このプロジェクトはMITライセンスの下でライセンスされています - 詳細は[LICENSE](LICENSE)ファイルをご覧ください。

## 📚 追加リソース

- [Terraformドキュメント](https://www.terraform.io/docs/index.html)
- [AWSドキュメント](https://docs.aws.amazon.com/)
- [Dockerドキュメント](https://docs.docker.com/)
- [MOAプロジェクトリポジトリ](https://github.com/Sunwood-ai-labs/moa)
