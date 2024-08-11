![](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE_03.png)

# s05_api_lambda

このサンドボックス環境は、AWS LambdaとAmazon API Gatewayを使用してサーバーレスAPIをデプロイするためのTerraform設定を提供します。

## 🎯 プロジェクトの目的

- AWS LambdaとAmazon API Gatewayを使用したサーバーレスAPIの構築方法を示す
- Terraformを使用してインフラストラクチャをコードとして管理する方法を学ぶ
- APIのセキュリティ設定（CORS）やモニタリング（CloudWatch Logs）の基本を理解する

## 🚀 セットアップ手順

1. 必要な依存関係をインストールします：
   - Terraform
   - AWS CLI
   - Python 3.9以上

2. AWS CLIの設定を行います：
   ```
   aws configure
   ```

3. このディレクトリに移動します：
   ```
   cd s05_api_lambda
   ```

4. Terraformの初期化を行います：
   ```
   terraform init
   ```

5. Terraformプランを確認します：
   ```
   terraform plan
   ```

6. インフラストラクチャをデプロイします：
   ```
   terraform apply
   ```

## 📁 ファイル構造

- `main.tf`: Terraformのメイン設定ファイル
- `variables.tf`: 変数定義ファイル
- `terraform.tfvars`: 変数値設定ファイル
- `client.py`: APIをテストするためのクライアントスクリプト
- `lambda/`: Lambda関数のソースコードを含むディレクトリ

## 🖥️ 使用方法

1. APIのデプロイ:
```bash
terraform apply
```

1. クライアントスクリプトの実行:
```bash
python client.py
```

```bash
(aws-terraform-sandbox-py3.12) C:\Prj\aws-terraform-sandbox\sandbox\s05_api_lambda>python client.py
╭────────────────────────────────────────────────────────────────────────────╮
│ API call successful                                                        │
╰────────────────────────────────────────────────────────────────────────────╯
       API Response        
┏━━━━━━━━━┳━━━━━━━━━━━━━━━┓
┃ Key     ┃ Value         ┃
┡━━━━━━━━━╇━━━━━━━━━━━━━━━┩
│ message │ Hello, World! │
└─────────┴───────────────┘
╭──────────────────────────── Full JSON Response ────────────────────────────╮
│   1 {                                                                      │
│   2   "message": "Hello, World!"                                           │
│   3 }                                                                      │
╰────────────────────────────────────────────────────────────────────────────╯
```

3. リソースの削除:
```bash
terraform destroy
```

## 🛠️ カスタマイズ

`terraform.tfvars`ファイルを編集することで、以下の設定をカスタマイズできます：

- `aws_region`: デプロイするAWSリージョン
- `lambda_function_name`: Lambda関数の名前
- `stage`: デプロイメントステージ（例: dev, prod）

## 📝 注意事項

- このプロジェクトは学習と実験を目的としています。本番環境での使用には適していません。
- AWSリソースの使用には料金が発生する可能性があります。使用後は必ずリソースを削除してください。
- API GatewayのCORS設定は、すべてのオリジンからのアクセスを許可しています。実際の使用時はこれを適切に制限してください。

## 🤝 貢献

バグの報告や機能の提案は、GitHubのIssueを通じて行ってください。プルリクエストも歓迎します！
