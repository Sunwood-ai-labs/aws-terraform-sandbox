![Architecture Diagram](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE_04.png)

# 🚀 s11_streamlit-fargate: AWS FargateでのStreamlitアプリケーション

このプロジェクトは、Terraformを使用してAWS Fargate上にStreamlitアプリケーションをデプロイする方法を示しています。コンテナ化されたStreamlitアプリを、スケーラブルで管理されたAWS環境で実行するために必要なインフラストラクチャをセットアップします。

## 🎯 プロジェクトの目的

- Terraformを使用してAWS Fargate上にStreamlitアプリケーションをデプロイする
- AWSにセキュアでスケーラブルなインフラストラクチャを構築する
- Dockerを使用したStreamlitアプリのコンテナ化を実演する
- Terraformを用いたインフラストラクチャ・アズ・コード（IaC）の例を提供する

## 🌟 主な特徴

- AWS Fargate上へのStreamlitアプリの自動デプロイメント
- Dockerを使用したアプリケーションのコンテナ化
- VPC、サブネット、セキュリティグループを使用したセキュアなネットワーク構成
- Fargateサービスへのトラフィックルーティング用のApplication Load Balancer（ALB）
- ECSタスク実行用のIAMロールとポリシー
- インフラストラクチャのプロビジョニング用Terraformスクリプト

## 📁 プロジェクト構造

```
s11_streamlit-fargate/
├─ app.py
├─ Dockerfile
├─ main.tf
├─ README.md
├─ requirements.txt
```

## 🚀 はじめ方

### 前提条件

- AWSアカウント
- Terraformがインストールされていること
- Dockerがインストールされていること
- AWS CLIが設定されていること

### デプロイ手順

1. リポジトリをクローンします：
   ```
   git clone https://github.com/your-repo/s11_streamlit-fargate.git
   cd s11_streamlit-fargate
   ```

2. Dockerイメージをビルドしてプッシュします：
   ```
   docker build -t makisunwood/streamlit-app:latest .
   docker push makisunwood/streamlit-app:latest
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

7. デプロイメントが完了すると、TerraformがStreamlitアプリケーションのURLを出力します。

## 📊 Streamlitアプリケーション

Streamlitアプリケーション（`app.py`）は、ランダムなデータを生成し、散布図を表示する簡単な例です。このアプリケーションは必要に応じてカスタマイズできます。

## 🔐 セキュリティ考慮事項

- アプリケーションはパブリックサブネットとプライベートサブネットを持つVPCにデプロイされます
- セキュリティグループを使用して、インバウンドとアウトバウンドのトラフィックを制御します
- IAMロールとポリシーを使用して、必要最小限の権限を付与します
- アプリケーションはApplication Load Balancerを介してアクセス可能です

## 📝 カスタマイズ

以下のファイルを修正することでプロジェクトをカスタマイズできます：

- `app.py`: Streamlitアプリケーションのコードを更新します
- `Dockerfile`: Dockerイメージの設定を変更します
- `main.tf`: AWSインフラストラクチャの設定を調整します
- `requirements.txt`: Pythonの依存関係を更新します

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

- [Streamlitドキュメント](https://docs.streamlit.io/)
- [Terraformドキュメント](https://www.terraform.io/docs/)
- [AWS Fargateドキュメント](https://docs.aws.amazon.com/fargate/)
- [Dockerドキュメント](https://docs.docker.com/)
