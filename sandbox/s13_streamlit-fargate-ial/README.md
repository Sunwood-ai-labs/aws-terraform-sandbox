![Architecture Diagram](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE_03.png)

# 🐱 にゃんこカフェ ダッシュボード: AWS Fargate上のStreamlitアプリケーション

このプロジェクトは、AWS FargateとECSを使用してStreamlitで作成されたにゃんこカフェのダッシュボードアプリケーションをデプロイします。Terraformを使用してインフラストラクチャをコード化しています。

## 🎯 プロジェクトの目的

- StreamlitアプリケーションをAWS Fargateにデプロイする
- Terraformを使用してAWSリソースを自動的にプロビジョニングする
- コンテナ化されたアプリケーションの簡単なデプロイと管理を実現する

## 🌟 主な特徴$$
$$
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

2. Dockerイメージをビルドしてプッシュします：
   ```
   docker build -t your-docker-hub-username/nyanko-cafe-app:latest .
   docker push your-docker-hub-username/nyanko-cafe-app:latest
   ```

3. `terraform.tfvars` ファイルを更新します：
   ```
   aws_region      = "ap-northeast-1"
   project_name    = "streamlit-nyanko-cafe"
   vpc_cidr        = "10.0.0.0/16"
   container_image = "your-docker-hub-username/nyanko-cafe-app:latest"
   task_cpu        = "256"
   task_memory     = "512"
   app_count       = 1
   ```

4. Terraformを初期化し、適用します：
   ```
   terraform init
   terraform plan
   terraform apply
   ```

5. デプロイが完了したら、出力されたALBのDNS名を使用してアプリケーションにアクセスできます。

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
