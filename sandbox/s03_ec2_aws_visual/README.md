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


## 🤖 生成AIを活用したAWS構成図の自動生成

このサンドボックス環境には、生成AIを活用してAWS構成図を自動生成するための新機能が追加されました。

### terraform_vis_prompt_generator.py

このスクリプトは以下の機能を提供します：

1. 必要なファイルの読み込み（Terraformの設定ファイル、状態ファイルなど）
2. AWS Diagramsライブラリのドキュメントのスクレイピング
3. 読み込んだ情報を元に、生成AIのためのプロンプトを作成
4. 作成したプロンプトをMarkdownファイルとして保存

#### 使用方法：

1. 以下のコマンドを実行してプロンプトを生成します：
   ```
   python terraform_vis_prompt_generator.py
   ```

2. 生成されたプロンプト（terraform_visualization_prompt.md）を、Claude 3.5 Sonnetなどの生成AIモデルに入力します。

3. 生成AIが作成したPythonスクリプトを `aws_terraform_visualizer3.py` として保存します。

4. 以下のコマンドを実行して構成図を生成します：
   ```
   python aws_terraform_visualizer3.py
   ```

この機能により、Terraformの設定に基づいて最新のAWS構成図を簡単に生成できます。構成の変更があった場合も、このプロセスを繰り返すことで、常に最新の構成図を維持することができます。

> [!NOTE]
> 生成AIを使用する際は、出力結果を必ず確認し、必要に応じて修正を加えてください。生成されたスクリプトがプロジェクトの要件を満たしていることを確認することが重要です。


## ⚠️ 注意事項

- このサンドボックス環境は学習と実験を目的としています。本番環境での使用には適していません。
- AWSリソースの使用には料金が発生する可能性があります。使用後は必ずリソースを削除してください。
- セキュリティグループの設定を確認し、必要に応じて調整してください。
- 自動生成された構成図は参考程度にとどめ、重要な決定には専門家の判断を仰いでください。

## 🤝 貢献

バグの報告や機能の提案は、GitHubのIssueを通じて行ってください。プルリクエストも歓迎します！
