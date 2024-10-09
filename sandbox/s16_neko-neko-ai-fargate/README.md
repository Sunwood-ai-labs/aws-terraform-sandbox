# Project: s16_neko-neko-ai-fargate

<p align="center">
<img src="https://huggingface.co/datasets/MakiAi/IconAssets/resolve/main/neko-neko-ai.png" width="30%">
<br>
<h1 align="center">🐱 ねこねこカンパニー AIアシスタント</h1>
<h2 align="center">
  ～ AWS Fargate上のStreamlitチャットボットアプリケーション ～
</h2>

</p>

このプロジェクトは、AWS FargateとECSを使用して、ねこねこカンパニーのAIアシスタントであるStreamlitアプリケーションをデプロイします。AIアシスタントは、AWS BedrockのClaude-3-haikuモデルを使用して、猫らしい口調でユーザーの質問に答えます。Terraformを使用してインフラストラクチャをコード化し、IPホワイトリスト機能を実装しています。

## 🎯 プロジェクトの目的

- StreamlitによるAIアシスタントアプリケーションをAWS Fargateにデプロイする
- Terraformを使用してAWSリソースを自動的にプロビジョニングする
- AWS Bedrockのモデルを活用して自然な対話を実現する
- IPホワイトリストによるセキュアなアクセス制御を実装する

## 🌟 主な特徴

- **AIアシスタント**: 猫らしい口調でユーザーの質問に答える対話型チャットボット
- **AWS Bedrockの統合**: litellmライブラリを使用してAWS BedrockのClaude-3-haikuモデルを利用
- **Streamlitアプリケーション**: 使いやすいチャットインターフェースを提供
- **Dockerコンテナ**: アプリケーションをコンテナ化して簡単にデプロイ可能
- **AWS FargateとECS**: サーバーレスでのスケーラブルなデプロイメント
- **Application Load Balancer**: 高可用性と負荷分散を実現
- **TerraformによるIAC**: インフラストラクチャをコードで管理
- **IPホワイトリスト機能**: CSVファイルを使用してアクセスを制御

## 📁 プロジェクト構造

```
s16_neko-neko-ai-fargate/
├─ pages/
│  ├─ README.py
│  ├─ ReleaseNotes.py
├─ script/
│  ├─ update-fargate-image.ps1
├─ Terraform/
│  ├─ main.tf
│  ├─ outputs.tf
│  ├─ terraform.tfvars
│  ├─ variables.tf
│  ├─ whitelist.csv
├─ app.py
├─ Dockerfile
├─ issue_creator.log
├─ README.md
├─ requirements.txt
```

## 🚀 はじめ方

### 前提条件

- AWSアカウント
- Terraformがインストールされていること
- AWS CLIが設定されていること
- Dockerがインストールされていること

### デプロイ手順

1. リポジトリをクローンします：

   ```
   git clone https://github.com/your-repo/s16_neko-neko-ai-fargate.git
   cd s16_neko-neko-ai-fargate
   ```

2. Dockerイメージをビルドします：

   ```
   docker build -t neko-neko-ai-app .
   ```

3. イメージをAmazon ECRにプッシュします：

   a. ECRリポジトリを作成：

   ```
   aws ecr create-repository --repository-name neko-neko-ai-app --region us-east-1
   ```

   b. ECRにログイン：

   ```
   aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <YOUR-ACCOUNT-ID>.dkr.ecr.us-east-1.amazonaws.com
   ```

   c. イメージにタグを付ける：

   ```
   docker tag neko-neko-ai-app:latest <YOUR-ACCOUNT-ID>.dkr.ecr.us-east-1.amazonaws.com/neko-neko-ai-app:latest
   ```

   d. ECRにイメージをプッシュ：

   ```
   docker push <YOUR-ACCOUNT-ID>.dkr.ecr.us-east-1.amazonaws.com/neko-neko-ai-app:latest
   ```

4. `Terraform/terraform.tfvars` ファイルを更新します：

   ```
   aws_region      = "us-east-1"
   project_name    = "neko-neko-ai-app"
   vpc_cidr        = "10.0.0.0/16"
   container_image = "<YOUR-ACCOUNT-ID>.dkr.ecr.us-east-1.amazonaws.com/neko-neko-ai-app:latest"
   task_cpu        = "256"
   task_memory     = "512"
   app_count       = 1
   ```

5. `Terraform/whitelist.csv` ファイルを編集して、許可するIPアドレスを設定します：

   ```
   ip,description
   203.0.113.0/24,Client demo network
   192.0.2.0/24,Office network
   ```

6. Terraformを初期化し、適用します：

   ```
   cd Terraform
   terraform init
   terraform plan
   terraform apply
   ```

7. デプロイが完了したら、出力されたALBのDNS名を使用してアプリケーションにアクセスできます。

## 📊 アプリケーションの特徴

- **猫のAIアシスタント**: ユーザーの質問に猫らしい口調で答えます。
- **対話型チャットインターフェース**: Streamlitで構築されたシンプルで使いやすいチャットインターフェース。
- **AWS Bedrockの活用**: AWS BedrockのClaude-3-haikuモデルを使用して、自然な対話を実現。

## 🔐 セキュリティ考慮事項

- **VPCとセキュリティグループ**: 安全なネットワーク設定を提供。
- **IAMロールとポリシー**: 最小権限の原則を適用し、必要なリソースへのアクセスのみを許可。
- **IPホワイトリスト**: 許可されたIPアドレスのみがアプリケーションにアクセス可能。

## 📝 カスタマイズ

- `app.py`: AIアシスタントの応答や機能をカスタマイズ。
- `Dockerfile`: Dockerイメージのビルドプロセスを調整。
- `Terraform/main.tf`: AWSリソースの設定を変更。
- `Terraform/variables.tf` と `Terraform/terraform.tfvars`: 変数の値を更新。
- `Terraform/whitelist.csv`: 許可するIPアドレスを追加または削除。

## 🧹 クリーンアップ

作成したすべてのリソースを削除するには：

```
terraform destroy
```

## 🔄 イメージの更新とデプロイ

アプリケーションを更新した後、新しいイメージをビルドしてデプロイする必要があります。提供されているPowerShellスクリプトを使用して自動化できます。

### PowerShellスクリプトを使用した更新

`script/update-fargate-image.ps1` スクリプトを使用して、イメージのビルド、ECRへのプッシュ、およびECSサービスの更新を自動的に行えます。

スクリプトを使用するには：

1. PowerShellを開きます。
2. プロジェクトディレクトリに移動します。
3. 次のコマンドを実行します：

   ```powershell
   .\script\update-fargate-image.ps1
   ```

### 手動更新手順

PowerShellスクリプトを使用しない場合は、以下の手順を実行します：

1. 新しいDockerイメージをビルド：

   ```
   docker build -t neko-neko-ai-app .
   ```

2. イメージをECRにプッシュ（前述の手順3を参照）。

3. ECSサービスを更新：

   ```
   aws ecs update-service --cluster <CLUSTER_NAME> --service <SERVICE_NAME> --force-new-deployment
   ```

## Docker Hubを使用したデプロイ方法

Amazon ECRの代わりにDocker Hubを使用してイメージをホストすることも可能です。以下はDocker Hubを使用した手順です：

1. Docker Hubにログイン：

   ```
   docker login
   ```

2. イメージにタグを付ける：

   ```
   docker tag neko-neko-ai-app:latest your-dockerhub-username/neko-neko-ai-app:latest
   ```

3. Docker Hubにイメージをプッシュ：

   ```
   docker push your-dockerhub-username/neko-neko-ai-app:latest
   ```

4. `Terraform/terraform.tfvars` ファイルを更新して、Docker Hubのイメージを使用するように設定：

   ```
   aws_region      = "us-east-1"
   project_name    = "neko-neko-ai-app"
   vpc_cidr        = "10.0.0.0/16"
   container_image = "your-dockerhub-username/neko-neko-ai-app:latest"
   task_cpu        = "256"
   task_memory     = "512"
   app_count       = 1
   ```

5. Terraformの適用手順は同じです。

**注意**: Docker Hubのパブリックリポジトリを使用する場合、イメージが公開されることに留意してください。プライベートリポジトリを使用する場合は、ECSタスク実行ロールにDocker Hubの認証情報を提供する必要があります。

## 🤝 貢献

貢献を歓迎します！バグ報告や機能追加の提案、プルリクエストをお待ちしています。

## 📜 ライセンス

このプロジェクトはMITライセンスの下で公開されています。

## 📚 追加リソース

- [Streamlitドキュメント](https://docs.streamlit.io/)
- [Terraformドキュメント](https://www.terraform.io/docs)
- [AWSドキュメント](https://docs.aws.amazon.com/)
- [Dockerドキュメント](https://docs.docker.com/)
- [AWS Bedrockドキュメント](https://docs.aws.amazon.com/bedrock/)
- [litellmライブラリ](https://github.com/abetlen/litellm)
