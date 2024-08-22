![](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE_02.png)

# 🔐 s07_simple_sso: SSOユーザーによるS3バケット作成

このサンドボックス環境は、AWS Single Sign-On (SSO) ユーザーがS3バケットを作成し、アクセスするための簡単な設定を提供します。

## 🎯 プロジェクトの目的

- AWS SSOを使用したリソース管理の基本を学ぶ
- TerraformでS3バケットを作成し、SSOユーザーにアクセス権を付与する方法を示す
- 一時的な認証情報を使用してAWSリソースにアクセスする方法を理解する

## 🚀 セットアップ手順

1. 必要な依存関係をインストールします：
   - Terraform
   - AWS CLI

2. AWS CLIの設定を行います（SSOユーザーとして）：
   ```bash
   aws configure sso
   ```

3. このディレクトリに移動します：
   ```bash
   cd s07_simple_sso
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
- `terraform.tfvars.example`: `terraform.tfvars` のサンプルファイル

## 🖥️ 使用方法

1. S3バケットの作成:
   ```bash
   terraform apply
   ```

2. 作成されたS3バケットの確認:
   ```bash
   aws s3 ls
   ```

3. リソースの削除:
   ```bash
   terraform destroy
   ```

## 🛠️ カスタマイズ

`terraform.tfvars` ファイルを編集することで、以下の設定をカスタマイズできます：

- `aws_region`: デプロイするAWSリージョン
- `bucket_prefix`: 作成するS3バケットの名前のプレフィックス
- `tags`: リソースに適用するタグ

## 📝 注意事項

- このプロジェクトは学習と実験を目的としています。本番環境での使用には適していません。
- AWSリソースの使用には料金が発生する可能性があります。使用後は必ずリソースを削除してください。
- `terraform.tfvars` ファイルには機密情報が含まれる可能性があるため、バージョン管理システムにコミットしないでください。

## 🔑 AWS SSOの設定

AWS SSOを使用するには、以下の手順が必要です：

1. AWS SSOを有効化し、組織を設定します。
2. ユーザーとグループを作成します。
3. アクセス許可セットを作成し、必要な権限を付与します。
4. AWS アカウントにアクセス許可セットを割り当てます。

詳細な手順については、[AWS SSO のドキュメント](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html)を参照してください。

## 🤝 貢献

バグの報告や機能の提案は、GitHubのIssueを通じて行ってください。プルリクエストも歓迎します！
