<readme>
<p align="center">
<img src="https://huggingface.co/datasets/MakiAi/IconAssets/resolve/main/aws-terraform-sandbox.png" width="100%">
<br>
<h1 align="center">aws-terraform-sandbox</h1>
<h2 align="center">
  ～ Building Cloud Infrastructures, Block by Block ～
<br>
  <img alt="GitHub Last Commit" src="https://img.shields.io/github/last-commit/Sunwood-ai-labs/aws-terraform-sandbox">
  <img alt="GitHub Top Language" src="https://img.shields.io/github/languages/top/Sunwood-ai-labs/aws-terraform-sandbox">
  <img alt="License" src="https://img.shields.io/github/license/Sunwood-ai-labs/aws-terraform-sandbox">
  <br>
  <a href="https://github.com/Sunwood-ai-labs/aws-terraform-sandbox" title="Go to GitHub repo"><img src="https://img.shields.io/static/v1?label=Sunwood-ai-labs&message=aws-terraform-sandbox&color=blue&logo=github"></a>
  <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/Sunwood-ai-labs/aws-terraform-sandbox?style=social">
  <a href="https://github.com/Sunwood-ai-labs/aws-terraform-sandbox"><img alt="GitHub forks" src="https://img.shields.io/github/forks/Sunwood-ai-labs/aws-terraform-sandbox?style=social"></a>
<br>
<p align="center">
  <a href="https://hamaruki.com/"><b>[🌐 Website]</b></a> •
  <a href="https://github.com/Sunwood-ai-labs"><b>[🐱 GitHub]</b></a> •
  <a href="https://x.com/hAru_mAki_ch"><b>[🐦 Twitter]</b></a> •
  <a href="https://hamaruki.com/"><b>[🍀 Official Blog]</b></a>
   <br>

   <a href="https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/blob/main/README.md"><img src="https://img.shields.io/badge/ドキュメント-日本語-white.svg" alt="JA doc"/></a>
   <a href="https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/blob/main/docs/README.en.md"><img src="https://img.shields.io/badge/english-document-white.svg" alt="EN doc"></a>
</p>

</h2>

</p>

>[!IMPORTANT]
>このリポジトリのリリースノートやREADME、コミットメッセージの9割近くは[claude.ai](https://claude.ai/)や[ChatGPT4](https://chatgpt.com/)を活用した[AIRA](https://github.com/Sunwood-ai-labs/AIRA), [SourceSage](https://github.com/Sunwood-ai-labs/SourceSage), [Gaiah](https://github.com/Sunwood-ai-labs/Gaiah), [HarmonAI_II](https://github.com/Sunwood-ai-labs/HarmonAI_II)で生成しています。

## 🌟 はじめに

**aws-terraform-sandbox** は、AWS クラウド環境のインフラストラクチャを Terraform で自動化・管理するための実験的なプラットフォームです。このリポジトリは、生成AIを活用してTerraformスクリプトを作成し、クラウドインフラストラクチャの構築を試行錯誤しながら学習することを目的としています。

様々な Terraform のテンプレートやスクリプトを使って、実際の AWS 環境で安全に実験できるスクリプトを提供します。また、生成AIを活用してインフラストラクチャを設計・実装するためのガイドラインも含まれています。

## 🚀 はじめる

1. リポジトリをクローンします：
   ```
   git clone https://github.com/Sunwood-ai-labs/aws-terraform-sandbox.git
   cd aws-terraform-sandbox
   ```

2. [AWS CLI](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html)をインストールし、認証情報を設定します。

3. [Terraform](https://developer.hashicorp.com/terraform/install)をインストールします。

4. 目的のサンドボックス環境に移動します：
   ```
   cd sandbox/s01_streamlit_aws_setup
   ```

5. Terraformを初期化し、実行します：
   ```
   terraform init
   terraform apply
   ```

6. プロンプトが表示されたら、`yes`と入力して確認します。

7. デプロイが完了したら、出力されたパブリックIPアドレスにアクセスして、Streamlitアプリケーションを確認します。

8. 作業終了時には、必ず以下のコマンドを実行してリソースを削除してください：
   ```
   terraform destroy
   ```
   確認プロンプトが表示されたら、`yes`と入力します。

> [!WARNING]
> `terraform destroy`コマンドは、作成したすべてのAWSリソースを削除します。実行前に、保持したいデータがないか確認してください。

## 📂 プロジェクト構造

```
aws-terraform-sandbox/
├─ sandbox/
│  ├─ s01_streamlit_aws_setup/
│  ├─ s02_streamlit_aws_deployer/
│  ├─ s03_ec2_aws_visual/
│  ├─ s04_simple_lambda/
│  │  ├─ lambda/
│  │  │  ├─ test/
│  │  │  │  ├─ src/
│  │  │  │  │  ├─ test_terraform.py
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ terraform.tfvars
│  │  ├─ client.py
│  ├─ s05_api_lambda/
│  │  ├─ lambda/
│  │  │  ├─ test/
│  │  │  │  ├─ src/
│  │  │  │  │  ├─ test_terraform.py
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ terraform.tfvars
│  │  ├─ client.py
│  ├─ s06_fastapi_lambda/
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ Dockerfile
│  │  ├─ lambda_tester_api.py
│  │  ├─ terraform.tfvars
│  │  ├─ requirements.txt
│  │  ├─ app.py
│  │  ├─ lambda_tester_local.py
│  ├─ s07_simple_sso/
│  │  ├─ terraform.example.tfvars
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ README.md
│  ├─ s08_ec2_docker/
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ terraform.tfvars
│  ├─ s09-ec2-docker-moa/
│  │  ├─ variables.tf
│  │  ├─ setup_script.sh
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ terraform.tfvars
│  ├─ s10-docker-ec2-scheduler-moa/
│  │  ├─ scripts/
│  │  │  ├─ setup_script.sh
│  │  ├─ modules/
│  │  │  ├─ networking/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ outputs.tf
│  │  │  │  ├─ main.tf
│  │  │  ├─ compute/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ outputs.tf
│  │  │  │  ├─ main.tf
│  │  │  ├─ iam/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ outputs.tf
│  │  │  │  ├─ main.tf
│  │  ├─ variables.tf
│  │  ├─ outputs.tf
│  │  ├─ main.tf
│  │  ├─ providers.tf
│  │  ├─ README.md
│  │  ├─ terraform.tfvars
│  ├─ s11_streamlit-fargate/
│  │  ├─ app.py
│  │  ├─ Dockerfile
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ requirements.txt
│  ├─ s13_streamlit-fargate-ial/
│  │  ├─ outputs.tf
│  │  ├─ Dockerfile
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ terraform.tfvars
│  │  ├─ app.py
│  │  ├─ variables.tf
│  │  ├─ requirements.txt
│  ├─ s14_streamlit-fargate-ial-modular/
│  │  ├─ Terraform/
│  │  │  ├─ modules/
│  │  │  │  ├─ alb/
│  │  │  │  │  ├─ variables.tf
│  │  │  │  │  ├─ main.tf
│  │  │  │  │  ├─ outputs.tf
│  │  │  │  ├─ ecs/
│  │  │  │  │  ├─ variables.tf
│  │  │  │  │  ├─ main.tf
│  │  │  │  │  ├─ outputs.tf
│  │  │  │  ├─ scheduler/
│  │  │  │  │  ├─ variables.tf
│  │  │  │  │  ├─ main.tf
│  │  │  │  ├─ security/
│  │  │  │  │  ├─ variables.tf
│  │  │  │  │  ├─ main.tf
│  │  │  │  │  ├─ outputs.tf
│  │  │  │  ├─ network/
│  │  │  │  │  ├─ variables.tf
│  │  │  │  │  ├─ main.tf
│  │  │  │  │  ├─ outputs.tf
│  │  │  ├─ script/
│  │  │  │  ├─ Cleanup-AWSResources.ps1
│  │  │  │  ├─ Cleanup-AWSResources2.ps1
│  │  │  ├─ terraform.tfvars
│  │  │  ├─ variables.tf
│  │  │  ├─ main.tf
│  │  │  ├─ Cleanup-TerraformState.ps1
│  │  │  ├─ outputs.tf
│  │  ├─ app.py
│  │  ├─ requirements.txt
│  │  ├─ Dockerfile
│  │  ├─ README.md
│  ├─ s15_streamlit-fargate-whitelist/
│  │  ├─ script/
│  │  │  ├─ update-fargate-image.ps1
│  │  ├─ Terraform/
│  │  │  ├─ terraform.tfvars
│  │  │  ├─ variables.tf
│  │  │  ├─ main.tf
│  │  │  ├─ whitelist.csv
│  │  │  ├─ outputs.tf
│  │  ├─ app.py
│  │  ├─ requirements.txt
│  │  ├─ Dockerfile
│  │  ├─ README.md
│  ├─ s16_neko-neko-ai-fargate/
│  │  ├─ script/
│  │  │  ├─ update-fargate-image.ps1
│  │  ├─ pages/
│  │  │  ├─ ReleaseNotes.py
│  │  │  ├─ README.py
│  │  ├─ Terraform/
│  │  │  ├─ terraform.tfvars
│  │  │  ├─ variables.tf
│  │  │  ├─ main.tf
│  │  │  ├─ whitelist.csv
│  │  │  ├─ outputs.tf
│  │  ├─ app.py
│  │  ├─ requirements.txt
│  │  ├─ Dockerfile
│  │  ├─ README.md
│  ├─ s11-docker-ec2-scheduler-moa-update/
│  │  ├─ modules/
│  │  │  ├─ compute/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ iam/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ networking/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  ├─ scripts/
│  │  │  ├─ setup_script.sh
│  │  ├─ providers.tf
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ outputs.tf
│  ├─ s18-docker-ec2-gitlab/
│  │  ├─ modules/
│  │  │  ├─ compute/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ iam/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ networking/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  ├─ scripts/
│  │  │  ├─ setup_script.sh
│  │  ├─ providers.tf
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ docker-compose.yml
│  │  ├─ whitelist.csv
│  │  ├─ outputs.tf
│  ├─ s11_streamlit-fargate/
│  │  ├─ app.py
│  │  ├─ requirements.txt
│  │  ├─ Dockerfile
│  │  ├─ README.md
│  │  ├─ main.tf
│  ├─ s04_simple_lambda/
│  │  ├─ lambda/
│  │  │  ├─ test/
│  │  │  │  ├─ src/
│  │  │  │  │  ├─ test_terraform.py
│  │  ├─ client.py
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  ├─ s09-ec2-docker-moa/
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ setup_script.sh
│  │  ├─ main.tf
│  ├─ s13_streamlit-fargate-ial/
│  │  ├─ Terraform/
│  │  │  ├─ terraform.tfvars
│  │  │  ├─ variables.tf
│  │  │  ├─ main.tf
│  │  │  ├─ outputs.tf
│  │  ├─ app.py
│  │  ├─ requirements.txt
│  │  ├─ Dockerfile
│  │  ├─ README.md
│  ├─ s01_streamlit_aws_setup/
│  │  ├─ terraform.tfstate
│  │  ├─ streamlit_aws_setup.tf
│  ├─ s06_fastapi_lambda/
│  │  ├─ app.py
│  │  ├─ requirements.txt
│  │  ├─ Dockerfile
│  │  ├─ lambda_tester_local.py
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ lambda_tester_api.py
│  ├─ s03_ec2_aws_visual/
│  │  ├─ aws-infrastructure-diagram.py
│  │  ├─ Dockerfile
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ aws_terraform_visualizer3.py
│  │  ├─ main.tf
│  │  ├─ docker-compose.yml
│  │  ├─ terraform_vis_prompt_generator.py
│  ├─ s17-docker-ec2-litellm-server/
│  │  ├─ modules/
│  │  │  ├─ compute/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ iam/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ networking/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  ├─ scripts/
│  │  │  ├─ setup_script.sh
│  │  ├─ providers.tf
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ whitelist.csv
│  │  ├─ outputs.tf
│  ├─ s05_api_lambda/
│  │  ├─ lambda/
│  │  │  ├─ test/
│  │  │  │  ├─ src/
│  │  │  │  │  ├─ test_terraform.py
│  │  ├─ client.py
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  ├─ s02_streamlit_aws_deployer/
│  │  ├─ terraform.tfstate
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  ├─ s10-docker-ec2-scheduler-moa/
│  │  ├─ modules/
│  │  │  ├─ compute/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ iam/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ networking/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  ├─ scripts/
│  │  │  ├─ setup_script.sh
│  │  ├─ providers.tf
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ outputs.tf
│  ├─ s08_ec2_docker/
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  ├─ s07_simple_sso/
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ terraform.example.tfvars
│  │  ├─ main.tf
│  ├─ README.md
├─ issue_creator.log
├─ pyproject.toml
├─ README.md
```

## 🛠 サンドボックス環境

このリポジトリには、以下のサンドボックス環境が含まれています：

1. **s01_streamlit_aws_setup**: 基本的なStreamlitアプリケーションをデプロイするためのAWSインフラストラクチャをセットアップします。

2. **s02_streamlit_aws_deployer**: より高度な設定でStreamlitアプリケーションをデプロイし、自動的な起動/停止スケジュールを含むAWSインフラストラクチャをセットアップします。

3. **s03_ec2_aws_visual**: EC2インスタンスとその関連リソース（VPC、サブネット、セキュリティグループなど）を作成し、視覚的に表示するためのツールを提供します。
    - 🎉 **EC2 インスタンスとその関連リソースの可視化機能**
    - 🎉 **生成AI を活用した AWS 構成図の自動生成機能**

4. **s04_simple_lambda**: シンプルなLambda関数のデプロイと管理のためのサンドボックス環境を追加しました。

5. **s05_api_lambda**: API GatewayとLambda関数を統合したサーバーレスAPIのデプロイ環境を追加しました。

6. **s06_fastapi_lambda**: FastAPIをAWS LambdaとAPI Gatewayを使用してデプロイする環境を提供します。
    - 🎉 **FastAPIサーバーレスAPIサンドボックス環境を追加** 🟢
    - 🎉 **ローカルからのLambda関数呼び出し機能を追加** 🟢
    - 🚀 **Terraform スクリプトに変数を導入** 🟢
    - 🚀 **Lambda 関数を呼び出すための Python スクリプトを追加** 🟢
    - 🚀 **API Gateway の URL を使用して Lambda 関数を呼び出すように変更** 🟢

7. **s07_simple_sso**: SSOユーザーによるS3バケットの作成とアクセス管理をより簡単に実現するためのサンドボックス環境を追加 🟢
    - `variables.tf`でS3バケットの名前のプレフィックスやタグをカスタマイズできます。
    - `terraform.tfvars.example`には設定例が用意されています。
    - `main.tf`ではS3バケットの作成とタグの適用を行っています。
    - `README.md`には環境の使用方法や設定方法が記載されています。

8. **s08_ec2_docker**: AWS EC2インスタンス上にDocker環境を構築するためのサンドボックス環境を追加しました。
    - 🎉 **`s08_ec2_docker` サンドボックス環境を追加** 🟢
    - EC2 インスタンス上にDockerとDocker Composeを自動インストールするためのTerraform設定を提供します。
    - プライベートサブネットとNAT Gatewayを使用したセキュアなネットワーク設定を提供します。
    - Systems ManagerによるEC2インスタンスへのセキュアなアクセスを提供します。
    - 環境構築と使用方法に関する詳細を`README.md`に記述しています。
    - `terraform.tfvars`で環境設定をカスタマイズできます。

9. **s09-ec2-docker-moa**: AWS EC2 インスタンス上に Docker 環境と MOA プロジェクトをデプロイするためのサンドボックス環境を追加しました。
    - 🎉 **`s09-ec2-docker-moa` サンドボックス環境を追加** 🟢
    - EC2 インスタンス上にDockerとDocker Composeを自動的にインストールして、MOA プロジェクトをセットアップします。
    - 環境構築と使用方法に関する詳細を`README.md`に記述しています。
    - `terraform.tfvars`で環境設定をカスタマイズできます。

10. **s10-docker-ec2-scheduler-moa**: AWS EC2 インスタンス上に MOA プロジェクトをデプロイし、スケジュールされた開始・停止時間を設定するためのサンドボックス環境を追加しました。
    - 🎉 **`s10-docker-ec2-scheduler-moa` サンドボックス環境を追加** 🟢
    - DockerとMOAがプリインストールされたEC2インスタンスを自動的にデプロイします。
    - EC2 インスタンスを自動的に開始・停止するスケジューラーを実装します。
    - AWS BedrockやCloud AIサービスを簡単に試せるようにします。
    - 環境構築と使用方法に関する詳細を`README.md`に記述しています。
    - `terraform.tfvars`で環境設定をカスタマイズできます。

11. **s11_streamlit-fargate**: AWS Fargate上でStreamlitアプリケーションをデプロイするための環境を提供します。
    - 🎉 **`s11_streamlit-fargate` サンドボックス環境を追加** 🟢
    - Dockerを使用してStreamlitアプリケーションをコンテナ化します。
    - AWS Fargate上にコンテナをデプロイし、スケーラブルな環境を構築します。
    - Application Load Balancerを使用してトラフィックを分散します。
    - VPCとセキュリティグループを使用してセキュアなネットワーク設定を提供します。
    - ECSクラスターとタスク定義の自動セットアップを行います。

12. **s13_streamlit-fargate-ial**: AWS Fargate上でStreamlitアプリケーションをデプロイするための環境を提供します。
    - 🎉 **`s13_streamlit-fargate-ial` サンドボックス環境を追加** 🟢
    - Dockerを使用してStreamlitアプリケーションをコンテナ化します。
    - AWS Fargate上にコンテナをデプロイし、スケーラブルな環境を構築します。
    - Application Load Balancerを使用してトラフィックを分散します。
    - VPCとセキュリティグループを使用してセキュアなネットワーク設定を提供します。
    - ECSクラスターとタスク定義の自動セットアップを行います。
    - にゃんこカフェダッシュボードアプリケーションを作成し、Streamlit で作成し、AWS Fargate と ECS を使用してデプロイする例を提供します

13. **s14_streamlit-fargate-ial-modular**: AWS Fargate で Streamlit アプリケーションをデプロイし、モジュール化された Terraform コードを使用してインフラストラクチャを管理するためのサンドボックス環境を追加しました。
    - 🎉 **`s14_streamlit-fargate-ial-modular` サンドボックス環境を追加** 🟢
    - モジュールを使用して、ネットワーク、セキュリティ、ALB、ECS などのインフラストラクチャコンポーネントを分離して管理します。
    - IP ホワイトリスト機能を導入し、ALB へのアクセスを制限できます。
    - 継続的インテグレーションと継続的デリバリー (CI/CD) パイプラインの構築を簡素化します。

14. **s15_streamlit-fargate-whitelist**: AWS Fargate上でStreamlitアプリケーションをデプロイし、IPホワイトリスト機能を追加した環境を提供します。
    - 🎉 **`s15_streamlit-fargate-whitelist` サンドボックス環境を追加** 🟢
    - Dockerを使用してStreamlitアプリケーションをコンテナ化します。
    - AWS Fargate上にコンテナをデプロイし、スケーラブルな環境を構築します。
    - Application Load Balancerを使用してトラフィックを分散します。
    - VPCとセキュリティグループを使用してセキュアなネットワーク設定を提供します。
    - ECSクラスターとタスク定義の自動セットアップを行います。
    - IPホワイトリスト機能を導入し、ALB へのアクセスを制限できます。
    - PowerShellスクリプトを使用して、Fargateイメージを更新できます。

15. **s16_neko-neko-ai-fargate**: AWS Fargate で Streamlit アプリケーションをデプロイし、IP ホワイトリスト機能を追加した環境を提供します。
    - 🎉 **`s16_neko-neko-ai-fargate` サンドボックス環境を追加** 🟢
    - Dockerを使用してStreamlitアプリケーションをコンテナ化します。
    - AWS Fargate上にコンテナをデプロイし、スケーラブルな環境を構築します。
    - Application Load Balancerを使用してトラフィックを分散します。
    - VPCとセキュリティグループを使用してセキュアなネットワーク設定を提供します。
    - ECSクラスターとタスク定義の自動セットアップを行います。
    - IPホワイトリスト機能を導入し、ALB へのアクセスを制限できます。
    - PowerShellスクリプトを使用して、Fargateイメージを更新できます。
    - AWS BedrockのClaude-3-haikuモデルを活用した、猫らしい口調でユーザーと対話するAIアシスタントを提供するStreamlitアプリケーションのデプロイ環境。

16. **s17-docker-ec2-litellm-server**: AWS EC2上でLiteLLMサーバーを自動的にデプロイします。
    - 🎉 **`s17-docker-ec2-litellm-server` サンドボックス環境を追加** 🟢
    - DockerとLiteLLMがプリインストールされたEC2インスタンスを自動的にデプロイします。
    - コスト最適化のためのスケジュール設定（開始：日本時間午前8時、日〜木曜日、停止：日本時間午後4時、月〜金曜日）
    - VPC、サブネット、セキュリティグループを使用した安全なネットワーク設定
    - EC2インスタンスとEventBridge用のIAMロールとポリシー
    - AWS Systems Managerとの統合によるインスタンス管理の簡素化
    - LiteLLMを通じた様々な言語モデルのサポート
    
17. **s18-docker-ec2-gitlab**: AWS EC2上にGitLabサーバーを自動的にデプロイします。
    - 🎉 **`s18-docker-ec2-gitlab` サンドボックス環境を追加** 🟢
    - DockerとGitLabがプリインストールされたEC2インスタンスを自動的にデプロイします。
    -  GitLabへのアクセスを許可するIPアドレスのホワイトリストを定義できます。
    - `docker-compose.yml`ファイルで、GitLabサーバーのバックアップを自動化するバックアップサービスが定義されています。
    
各サンドボックス環境の詳細については、[sandbox/README.md](sandbox/README.md)を参照してください。

## 📝 更新情報

- 🎉 [v2.5.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.5.0) :  GitLabサーバーを自動的にデプロイする新しいサンドボックス環境`s18-docker-ec2-gitlab`が追加されました。 🟢
- 🎉 [v2.4.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.4.0) :  LiteLLMサーバーの初期化スクリプトを追加し、セキュリティ強化と使い勝手の向上を行いました。 🟢
- 🎉 [v2.3.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.3.0) : `s16_neko-neko-ai-fargate` サンドボックス環境の追加、`s14_streamlit-fargate-ial-modular` の改善、ドキュメントの更新 🟢
- 🎉 [v2.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.2.0) : `s15_streamlit-fargate-whitelist` サンドボックス環境の追加と、ドキュメントの更新 🟢
- 🎉 [v2.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.1.0) : `s13_streamlit-fargate-ial` サンドボックス環境の改善と、ドキュメントの更新 🟢
- 🎉 [v2.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.0.0) : MOAプロジェクトのデプロイ機能、Gemini-1.5-flashモデルの追加、EC2スケジューラーの実装など 🟢
- 🎉 [v1.10.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.10.0) : AWS EC2インスタンス上にDocker環境を構築するための`s08_ec2_docker`サンドボックス環境を追加 🟢
- 🎉 [v1.9.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.9.1) : SSOユーザーによるS3バケットの作成とアクセス管理をより簡単に実現するための`s07_simple_sso`サンドボックス環境を追加 🟢
- 🎉 [v1.8.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.8.0) : FastAPIをAWS LambdaとAPI Gatewayを使用してデプロイする環境を提供します。 🟢
- 🎉 [v1.7.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.7.0) : API GatewayとLambda関数を統合したサーバーレスAPIのデプロイ環境である`s05_api_lambda`サンドボックス環境を追加 🟢
- 🎉 [v1.6.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.6.0) : シンプルなLambda関数のデプロイと管理のためのサンドボックス環境を追加しました。 🟢
- 🎉 [v1.5.0](https://github.com/Sunwood-ai-labs/AlphaExperiment/releases/tag/v1.11.1) : EC2インスタンスとその関連リソースの可視化機能、生成