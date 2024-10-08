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
   ex:) aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com
   ```

   c. イメージにタグを付ける：
   ```
   docker tag nyanko-cafe-app:latest <YOUR-ACCOUNT-ID>.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest
   ex:) docker tag nyanko-cafe-app:latest 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest
   ```

   d. ECRにイメージをプッシュ：
   ```
   docker push <YOUR-ACCOUNT-ID>.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest
   ex:) docker push 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest
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

## 🤝 貢献

貢献を歓迎します！お気軽にPull Requestを提出してください。

## 📜 ライセンス

このプロジェクトはMITライセンスの下でライセンスされています。

## 📚 追加リソース

- [Streamlitドキュメント](https://docs.streamlit.io/)
- [Terraformドキュメント](https://www.terraform.io/docs/index.html)
- [AWSドキュメント](https://docs.aws.amazon.com/)
- [Dockerドキュメント](https://docs.docker.com/)
