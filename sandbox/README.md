![](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE.png)

# 🏖️ aws-terraform-sandbox サンドボックス環境

このディレクトリには、AWS上でStreamlitアプリケーションをデプロイするための様々なTerraformスクリプトが含まれています。各サンドボックス環境は、異なる設定と機能を提供し、AWSインフラストラクチャの構築方法を学ぶのに役立ちます。


## 🌟 サンドボックス環境

### 🚀 s01_streamlit_aws_setup

基本的なStreamlitアプリケーションのデプロイ環境を提供します。

主な特徴：
- 📊 基本的なStreamlitアプリケーションのデプロイ
- 🔧 シンプルなネットワーク構成
- 🖐️ 手動での起動と停止

### 🚢 s02_streamlit_aws_deployer

より高度なStreamlitアプリケーションのデプロイ環境を提供します。

主な特徴：
- 📊 より高度なStreamlitアプリケーションのデプロイ
- 🕒 自動的な起動/停止スケジュール（平日の朝8時に起動、正午に停止）
- 🖥️ セッションマネージャーを使用したリモートアクセス
- 🔧 変数を使用したカスタマイズ可能な設定

### 🖼️ s03_ec2_aws_visual

EC2インスタンスとその関連リソースの視覚化ツールを提供します。

主な特徴：
- 📊 AWSリソースの視覚的な表現
- 🐳 Dockerを使用した環境のセットアップ
- 🔍 Terraform状態ファイルの解析と図表生成
- 🤖 LLMを使用したAWS構成図の自動生成

### 🔨 s04_simple_lambda

シンプルなAWS Lambda関数のデプロイ環境を提供します。

主な特徴：
- 🐍 PythonベースのLambda関数の実装
- 🌐 基本的なネットワークインフラの設定
- 🔒 IAMロールとポリシーの設定
- 🖥️ Lambda関数を呼び出すためのクライアントスクリプト

### 🌐 s05_api_lambda

API GatewayとLambda関数を組み合わせたサーバーレスAPIのデプロイ環境を提供します。

主な特徴：
- 🚀 API GatewayとLambda関数の統合
- 🔐 CORSの設定
- 📊 CloudWatch Logsによるモニタリング
- 🖥️ APIをテストするためのクライアントスクリプト

## 📚 使用方法

各サンドボックス環境を使用するには、以下の手順に従ってください：

1. 目的のサンドボックスディレクトリに移動します：
```
cd s01_streamlit_aws_setup
```
または
```
cd s02_streamlit_aws_deployer
```
または
```
cd s03_ec2_aws_visual
```

2. Terraformを初期化します：
```
terraform init
```

3. 必要に応じて、`terraform.tfvars`ファイルを編集してカスタム設定を行います。

4. Terraformプランを確認します：
```
terraform plan
```

5. リソースをデプロイします：
```
terraform apply
```

6. デプロイが完了したら、出力されたパブリックIPアドレスを使用してStreamlitアプリケーションにアクセスします（s01とs02の場合）。

7. s03_ec2_aws_visualの場合、以下のコマンドを実行してDockerコンテナを起動し、可視化ツールを使用します：
```
docker-compose up -d
docker-compose exec terraform-visualizer /bin/bash
```

8. 使用が終わったら、リソースを削除します：
```
terraform destroy
```

## 🔑 SSH接続

EC2インスタンスにSSH接続する方法は2つあります：

### 1. Session Manager経由のSSH接続

1. [Session Manager プラグインをインストール](https://docs.aws.amazon.com/ja_jp/systems-manager/latest/userguide/install-plugin-windows.html)します。

2. `~/.ssh/config`ファイル（Windowsの場合は`C:\Users\YourUsername\.ssh\config`）に以下の設定を追加します：

```
host i-* mi-*
    ProxyCommand aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters "portNumber=%p"
```

3. 以下のコマンドでSSH接続します（インスタンスIDを実際のものに置き換えてください）：

```bash
ssh -i "path/to/your/key.pem" ubuntu@i-1234567890abcdef0
```
 
例：
```bash
ssh -i "C:\Users\makim\.ssh\streamlit-terraform-keypair-tokyo-PEM.pem" ubuntu@i-0072dc723bbaca57b 
```

### 2. 直接SSH接続

Elastic IPが割り当てられている場合、以下のコマンドで直接SSH接続できます：

```bash
ssh -i "path/to/your/key.pem" ubuntu@18.181.167.229
```

注意: IPアドレスは実際に割り当てられたものに置き換えてください。

## ⚠️ 注意事項

- 💰 AWSの料金が発生する可能性があるため、使用しないリソースは必ず削除してください。
- 🔒 セキュリティグループの設定を確認し、必要に応じて調整してください。
- 🚨 実際の本番環境では、より堅牢なセキュリティ設定が必要です。これらのサンドボックス環境は学習目的で設計されています。

## 🔧 カスタマイズ

各サンドボックス環境は、`variables.tf`ファイルで定義された変数を使用してカスタマイズできます。必要に応じて、これらの変数の値を`terraform.tfvars`ファイルで上書きしてください。

詳細なカスタマイズオプションについては、各サンドボックスディレクトリ内のREADMEファイルを参照してください。
