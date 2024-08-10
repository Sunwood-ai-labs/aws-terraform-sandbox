![](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE_04.png)

# 🖼️ EC2 AWS Visual Sandbox

このサンドボックス環境は、AWS上でEC2インスタンスとその関連リソースを作成し、それらを視覚的に表現するためのツールを提供します。

## 🌟 主な特徴

- 📊 AWSリソースの視覚的な表現
- 🐳 Dockerを使用した環境のセットアップ
- 🔍 Terraform状態ファイルの解析と図表生成
- 🚀 EC2インスタンスと関連リソースの自動デプロイ
- 🤖 LLMを使用したAWS構成図の自動生成

## 📦 作成されるAWSリソース

- EC2インスタンス
- VPC
- パブリックサブネット
- インターネットゲートウェイ
- ルートテーブル
- セキュリティグループ
- Elastic IP

## 🚀 使用方法

1. このディレクトリに移動します：
 ```
 cd s03_ec2_aws_visual
 ```

2. Terraformを初期化し、リソースをデプロイします：
 ```
 terraform init
 terraform apply
 ```

3. Dockerコンテナを起動し、bashセッションを開始します：
 ```
 docker-compose up -d
 docker-compose exec terraform-visualizer /bin/bash
 ```

4. AWS構成図を自動生成します：
 ```
 python aws_terraform_visualizer3.py
 ```

5. 生成された`aws_ec2_infrastructure3.png`ファイルを確認します。

6. 使用が終わったら、リソースを削除します：
 ```
 terraform destroy
 ```

## 🤖 AWS構成図の自動生成

`aws_terraform_visualizer3.py`スクリプトは、LLM（大規模言語モデル）を使用して自動生成されています。生成プロセスは以下の通りです：

1. Claude 3.5 Sonnetなどのモデルに以下の情報をプロンプトとして入力：
   - `main.tf`ファイルの内容
   - `terraform.tfstate`ファイルの内容
   - https://diagrams.mingrammer.com/docs/nodes/aws のURL

2. 生成されたスクリプトを`aws_terraform_visualizer3.py`として保存

3. スクリプトを実行して構成図を生成

> [!WARNING]
> 注意：生成された構成図はあくまで参考程度です。実際のインフラストラクチャとの違いがある可能性があるため、必ず人間による確認が必要です。

## ⚠️ 注意事項

- このサンドボックス環境は学習と実験を目的としています。本番環境での使用には適していません。
- AWSリソースの使用には料金が発生する可能性があります。使用後は必ずリソースを削除してください。
- セキュリティグループの設定を確認し、必要に応じて調整してください。
- 自動生成された構成図は参考程度にとどめ、重要な決定には専門家の判断を仰いでください。

## 🤝 貢献

バグの報告や機能の提案は、GitHubのIssueを通じて行ってください。プルリクエストも歓迎します！
