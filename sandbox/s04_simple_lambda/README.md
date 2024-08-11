# s04_simple_lambda

このプロジェクトは、AWS Lambda関数をTerraformを使用してデプロイするためのシンプルな例を提供します。

## 🎯 プロジェクトの目的

- Terraformを使用してAWS Lambda関数をデプロイする方法を示す
- Lambda関数のための基本的なインフラストラクチャ（VPC、サブネット、セキュリティグループなど）をセットアップする
- Pythonを使用してLambda関数を実装し、クライアントからの呼び出し方法を示す

## 🚀 セットアップ手順

1. 必要な依存関係をインストールします：
   - Terraform
   - AWS CLI
   - Python 3.9以上

2. AWS CLIの設定を行います：
   ```
   aws configure
   ```

3. Terraformの初期化を行います：
   ```
   terraform init
   ```

4. Terraformプランを確認します：
   ```
   terraform plan
   ```

5. インフラストラクチャをデプロイします：
   ```
   terraform apply
   ```

## 📁 ファイル構造

- `main.tf`: Terraformのメイン設定ファイル
- `variables.tf`: 変数定義ファイル
- `terraform.tfvars`: 変数値設定ファイル
- `client.py`: Lambda関数を呼び出すクライアントスクリプト
- `lambda/`: Lambda関数のソースコードを含むディレクトリ

## 🖥️ 使用方法

1. Lambdaのデプロイ:
   ```
   terraform apply
   ```

2. クライアントスクリプトの実行:
   ```
   python client.py
   ```

3. リソースの削除:
   ```
   terraform destroy
   ```

## 📝 注意事項

- このプロジェクトは学習と実験を目的としています。本番環境での使用には適していません。
- AWSリソースの使用には料金が発生する可能性があります。使用後は必ずリソースを削除してください。

## 🤝 貢献

バグの報告や機能の提案は、GitHubのIssueを通じて行ってください。プルリクエストも歓迎します！
