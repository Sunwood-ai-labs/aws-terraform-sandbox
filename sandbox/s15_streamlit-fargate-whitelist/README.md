# 🐱 にゃんこカフェ ダッシュボード: AWS Fargate上のStreamlitアプリケーション

![Architecture Diagram](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE_03.png)

このプロジェクトは、AWS FargateとECSを使用してStreamlitで作成されたにゃんこカフェのダッシュボードアプリケーションをデプロイします。Terraformを使用してインフラストラクチャをコード化しています。

## 🎯 プロジェクトの目的

- StreamlitアプリケーションをAWS Fargateにデプロイする
- Terraformを使用してAWSリソースを自動的にプロビジョニングする
- コンテナ化されたアプリケーションの簡単なデプロイと管理を実現する

## 🌟 主な特徴

- StreamlitとPlotlyを使用した対話的なダッシュボード
- DockerコンテナとしてパッケージングされたStreamlitアプリケーション
- AWS FargateとECSを使用したサーバーレスデプロイメント
- Application Load Balancerを使用した高可用性と負荷分散
- Terraformを使用したインフラストラクチャのコード化

## 📁 プロジェクト構造

```
s13_streamlit-fargate-ial/
├─ app.py
├─ Dockerfile
├─ main.tf
├─ variables.tf
├─ outputs.tf
├─ terraform.tfvars
├─ requirements.txt
├─ README.md
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
   git clone https://github.com/your-repo/s13_streamlit-fargate-ial.git
   cd s13_streamlit-fargate-ial
   ```

2. Dockerイメージをビルドします：
   ```
   docker build -t nyanko-cafe-app .
   ```

3. イメージをリポジトリにプッシュします。以下のA）またはB）のいずれかを選択してください：

   A) Amazon ECRにプッシュする場合：

   a. ECRリポジトリを作成：
   ```
   aws ecr create-repository --repository-name nyanko-cafe-app --region ap-northeast-1
   ```

   b. ECRにログイン：
   ```
   aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin <YOUR-ACCOUNT-ID>.dkr.ecr.ap-northeast-1.amazonaws.com
   ex:) aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 123456789.dkr.ecr.ap-northeast-1.amazonaws.com
   ```

   c. イメージにタグを付ける：
   ```
   docker tag nyanko-cafe-app:latest <YOUR-ACCOUNT-ID>.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest
   ex:) docker tag nyanko-cafe-app:latest 123456789.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest
   ```

   d. ECRにイメージをプッシュ：
   ```
   docker push <YOUR-ACCOUNT-ID>.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest
   ex:) docker push 123456789.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest
   ```

   B) Docker Hubにプッシュする場合：

   a. Docker Hubにログイン：
   ```
   docker login
   ```

   b. イメージにタグを付ける：
   ```
   docker tag nyanko-cafe-app:latest your-dockerhub-username/nyanko-cafe-app:latest
   ```

   c. Docker Hubにイメージをプッシュ：
   ```
   docker push your-dockerhub-username/nyanko-cafe-app:latest
   ```

4. `terraform.tfvars` ファイルを更新します。使用したリポジトリに応じて以下のように設定します：

   ECRの場合：
   ```
   container_image = "<YOUR-ACCOUNT-ID>.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest"
   ```

   Docker Hubの場合：
   ```
   container_image = "your-dockerhub-username/nyanko-cafe-app:latest"
   ```

   その他の設定：
   ```
   aws_region      = "ap-northeast-1"
   project_name    = "streamlit-nyanko-cafe"
   vpc_cidr        = "10.0.0.0/16"
   task_cpu        = "256"
   task_memory     = "512"
   app_count       = 1
   ```

5. Terraformを初期化し、適用します：
   ```
   terraform init
   terraform plan
   terraform apply
   ```

6. デプロイが完了したら、出力されたALBのDNS名を使用してアプリケーションにアクセスできます。

## 📊 アプリケーションの特徴

- 月間来店者数のグラフ表示
- 人気の猫ちゃんの円グラフ
- 主要な統計情報のメトリクス表示
- にゃんこカフェについての説明

## 🔐 セキュリティ考慮事項

- VPC、サブネット、セキュリティグループを使用した安全なネットワーク設定
- ALBとECSタスク用の適切に設定されたセキュリティグループ
- IAMロールとポリシーを使用した最小権限の原則の適用

## 📝 カスタマイズ

- `app.py`: Streamlitアプリケーションのコードを修正してダッシュボードをカスタマイズ
- `main.tf`: AWSリソースの設定を調整
- `variables.tf` と `terraform.tfvars`: 変数の値を更新

## 🧹 クリーンアップ

作成したすべてのリソースを削除するには：

```
terraform destroy
```

## 🔄 イメージの更新とデプロイ

アプリケーションを更新した後、新しいイメージをビルドしてデプロイする必要があります。この処理は手動で行うか、提供されているPowerShellスクリプトを使用して自動化できます。

### PowerShellスクリプトを使用した更新

`update-fargate-image.ps1`という名前のPowerShellスクリプトが用意されています。このスクリプトは、イメージのビルド、ECRへのプッシュ、およびECSサービスの更新を自動的に行います。

スクリプトを使用するには：

1. PowerShellを管理者権限で開きます。
2. プロジェクトディレクトリに移動します。
3. 次のコマンドを実行します：

   ```powershell
   .\update-fargate-image.ps1
   ```

### 手動更新手順

PowerShellスクリプトを使用しない場合は、以下の手順で手動更新を行うことができます：

1. 新しいDockerイメージをビルド：
   ```
   docker build -t nyanko-cafe-app:latest .
   ```

2. ECRにログイン：
   ```
   aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 123456789.dkr.ecr.ap-northeast-1.amazonaws.com
   ```

3. イメージにECRリポジトリのタグを付ける：
   ```
   docker tag nyanko-cafe-app:latest 123456789.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest
   ```

4. ECRにイメージをプッシュ：
   ```
   docker push 123456789.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest
   ```

5. ECSサービスを強制的に新しいデプロイメントにする：
   ```
   aws ecs update-service --cluster streamlit-nyanko-cafe-cluster --service streamlit-nyanko-cafe-service --force-new-deployment
   ```

6. デプロイの状態を確認：
   ```
   aws ecs describe-services --cluster streamlit-nyanko-cafe-cluster --services streamlit-nyanko-cafe-service
   ```

これらの手順を実行することで、新しいイメージがビルドされ、ECRにプッシュされ、ECSサービスが更新されて新しいイメージを使用するようになります。

注意：これらのコマンドを実行する前に、AWS CLIとDocker CLIが正しく設定されていること、および必要な権限があることを確認してください。

## 🤝 貢献

貢献を歓迎します！お気軽にPull Requestを提出してください。

## 📜 ライセンス

このプロジェクトはMITライセンスの下でライセンスされています。

## 📚 追加リソース

- [Streamlitドキュメント](https://docs.streamlit.io/)
- [Terraformドキュメント](https://www.terraform.io/docs/index.html)
- [AWSドキュメント](https://docs.aws.amazon.com/)
- [Dockerドキュメント](https://docs.docker.com/)
