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
│  ├─ README.md
├─ docs/
│  ├─ REQUIREMENTS_DEFINITION.md
├─ issue_creator.log
├─ README.md
├─ pyproject.toml
```

## 🛠 サンドボックス環境

このリポジトリには、以下のサンドボックス環境が含まれています：

1. **s01_streamlit_aws_setup**: 基本的なStreamlitアプリケーションをデプロイするためのAWSインフラストラクチャをセットアップします。

2. **s02_streamlit_aws_deployer**: より高度な設定でStreamlitアプリケーションをデプロイし、自動的な起動/停止スケジュールを含むAWSインフラストラクチャをセットアップします。

3. **s03_ec2_aws_visual**: EC2インスタンスとその関連リソース（VPC、サブネット、セキュリティグループなど）を作成し、視覚的に表示するためのツールを提供します。
    - 🎉 **EC2 インスタンスとその関連リソースの可視化機能**
    - 🎉 **生成AI を活用した AWS 構成図の自動生成機能**

4. **s04_simple_lambda**: シンプルなLambda関数のデプロイと管理のためのサンドボックス環境を追加しました。

各サンドボックス環境の詳細については、[sandbox/README.md](sandbox/README.md)を参照してください。

## 📝 更新情報

- 🎉 [v1.6.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.6.0) : シンプルなLambda関数のデプロイと管理のためのサンドボックス環境を追加しました。 🟢
- 🎉 [v1.5.0](https://github.com/Sunwood-ai-labs/AlphaExperiment/releases/tag/v1.11.1) : EC2インスタンスとその関連リソースの可視化機能、生成AI を活用した AWS 構成図の自動生成機能を追加しました 🟢
- 🎉 [v1.4.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.4.0) : EC2 AWS Visual Sandboxを追加 🟢
- 🎉 [v1.3.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.3.0) : Streamlitアプリデプロイヤーのセキュリティ強化とドキュメント改善
- 🎉 [v1.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.2.0) : StreamlitアプリのデプロイメントのためのTerraform設定を追加
- 🎉 [v1.1.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.1) : ドキュメントの改善とスタイルの変更
- 🎉 [v1.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.0) : ヘッダー画像生成アルゴリズムの調整
- [v1.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.0.0) : 整備化スクリプトの整備

## 🤖 生成AI活用

このリポジトリでは、生成AIを活用してTerraformスクリプトを作成しています。生成AIを使用してインフラストラクチャを設計・実装するための要件定義書は [docs/REQUIREMENTS_DEFINITION.md](docs/REQUIREMENTS_DEFINITION.md) にあります。この文書を参照することで、効果的に生成AIを活用してAWSリソースを構築する方法を学ぶことができます。

## 🤝 コントリビューション

1. このリポジトリをフォークします。
2. 新しいブランチを作成します（`git checkout -b feature/amazing-feature`）。
3. 変更をコミットします（`git commit -m 'Add some amazing feature'`）。
4. ブランチにプッシュします（`git push origin feature/amazing-feature`）。
5. プルリクエストを作成します。

## 📄 ライセンス

このプロジェクトはMITライセンスの下で公開されています。詳細は[LICENSE](LICENSE)ファイルをご覧ください。

## 🙏 謝辞

- [Terraform](https://www.terraform.io/)
- [AWS](https://aws.amazon.com/)
- [Streamlit](https://streamlit.io/)

---

開発者：[Sunwood-ai-labs](https://github.com/Sunwood-ai-labs)
</readme>