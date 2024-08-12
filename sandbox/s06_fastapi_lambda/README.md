![](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE_04.png)

# 🚀 s06_fastapi_lambda

このサンドボックス環境は、FastAPIをAWS LambdaとAPI Gatewayを使用してデプロイするためのTerraform設定を提供します。

## 🎯 プロジェクトの目的

- FastAPIを使用したサーバーレスAPIの構築方法を示す
- AWS LambdaとAmazon API Gatewayを使用したデプロイメントプロセスを学ぶ
- Dockerコンテナを使用したLambda関数のパッケージングと展開を理解する
- API KeyとUsage Planを使用したAPIのセキュリティと使用量制御を実装する

## 🚀 セットアップ手順

1. 必要な依存関係をインストールします：
   - Terraform
   - AWS CLI
   - Docker
   - Python 3.9以上

2. AWS CLIの設定を行います：
```bash
aws configure
```

3. このディレクトリに移動します：
```bash
cd s06_fastapi_lambda
```

4. Dockerイメージをビルドします：
```bash
docker build -t fastapi-lambda .
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
- `terraform.tfvars`: 変数値設定ファイル
- `app.py`: FastAPIアプリケーションのソースコード
- `Dockerfile`: Lambda関数用のDockerイメージ設定
- `requirements.txt`: Pythonの依存関係リスト
- `lambda_tester_api.py`: デプロイされたAPIをテストするスクリプト
- `lambda_tester_local.py`: ローカルでLambda関数をテストするスクリプト

## 🖥️ 使用方法

### Terraformを使用した自動デプロイ

1. APIのデプロイ:
```bash
terraform apply
```

2. APIテストスクリプトの実行:
```bash
python lambda_tester_api.py
```

3. リソースの削除:
```bash
terraform destroy
```

### マニュアルでの実行手順

1. Dockerイメージのビルド:
```bash
docker build -t fastapi-lambda .
```

2. ローカルでのDockerコンテナ実行:
```bash
docker run -p 9000:8080 fastapi-lambda
```

3. ECRリポジトリへのログインとイメージのプッシュ:
```bash
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com
docker tag fastapi-lambda:latest 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com/fastapi-lambda-repo:latest
docker push 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com/fastapi-lambda-repo:latest
```

### ECRリポジトリへのログインと認証手順

注意: これらの手順はTerraformによって自動化されていますが、問題が発生した場合に手動で実行することができます。

1. AWS CLIの設定を確認:
```bash
aws configure list
```

2. ECRリポジトリへのログイン:
```bash
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com
```

3. ECRリポジトリの作成（必要な場合）:
```bash
aws ecr create-repository --repository-name fastapi-lambda-repo --region ap-northeast-1
```

4. イメージのプッシュ:
```bash
docker push 498218886114.dkr.ecr.ap-northeast-1.amazonaws.com/fastapi-lambda-repo:latest
```

5. ECRリポジトリのイメージ確認:
```bash
aws ecr list-images --repository-name fastapi-lambda-repo
```

## 🛠️ カスタマイズ

`terraform.tfvars`ファイルを編集することで、以下の設定をカスタマイズできます：

- `aws_region`: デプロイするAWSリージョン
- `lambda_function_name`: Lambda関数の名前
- `stage`: デプロイメントステージ（例: dev, prod）

## 📝 注意事項

- このプロジェクトは学習と実験を目的としています。本番環境での使用には適していません。
- AWSリソースの使用には料金が発生する可能性があります。使用後は必ずリソースを削除してください。
- API Keyの管理には十分注意してください。誤って公開されないようにしてください。

## 🔧 トラブルシューティング

- ECRログインに問題がある場合は、以下を確認してください：
  - AWS CLIの認証情報が正しく設定されているか
  - 使用しているIAMユーザーまたはロールがECRへのプッシュ権限を持っているか
  - AWSアカウントIDが正しいか（498218886114が正しいことを確認）

## 📊 Lambdaのテスト

Lambdaをテストする際は、以下のようなJSONペイロードを使用できます：

```json
{
  "version": "2.0",
  "routeKey": "GET /",
  "rawPath": "/",
  "rawQueryString": "",
  "headers": {
    "accept": "*/*",
    "content-length": "0",
    "host": "your-api-id.execute-api.your-region.amazonaws.com",
    "user-agent": "curl/7.64.1",
    "x-amzn-trace-id": "Root=1-5e9f8f8f-8f8f8f8f8f8f8f8f8f8f8f8f",
    "x-forwarded-for": "1.2.3.4",
    "x-forwarded-port": "443",
    "x-forwarded-proto": "https"
  },
  "requestContext": {
    "accountId": "123456789012",
    "apiId": "your-api-id",
    "domainName": "your-api-id.execute-api.your-region.amazonaws.com",
    "domainPrefix": "your-api-id",
    "http": {
      "method": "GET",
      "path": "/",
      "protocol": "HTTP/1.1",
      "sourceIp": "1.2.3.4",
      "userAgent": "curl/7.64.1"
    },
    "requestId": "JKJaXmPLvHcESHA=",
    "routeKey": "GET /",
    "stage": "$default",
    "time": "12/Mar/2020:19:03:58 +0000",
    "timeEpoch": 1583348638390
  },
  "isBase64Encoded": false
}
```

## 🤝 貢献

バグの報告や機能の提案は、GitHubのIssueを通じて行ってください。プルリクエストも歓迎します！
