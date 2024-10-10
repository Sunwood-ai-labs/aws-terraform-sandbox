# 🚀 s17-docker-ec2-litellm-server: AWS EC2上のLiteLLMサーバーデプロイメント

このプロジェクトは、Terraformを使用してAWS EC2インスタンス上にDockerでLiteLLMサーバーを自動的にデプロイします。

## 🎯 プロジェクトの目的

- Terraformを使用してAWS EC2インスタンス上にLiteLLMサーバーをデプロイする
- LiteLLMと各種言語モデルを使用するための安全で独立した環境を提供する
- AWS BedrockやCloud AIサービスを簡単に試せるようにする
- EC2インスタンスの自動開始・停止によるコスト最適化を実現する

## 🌟 主な特徴

- DockerとLiteLLMがプリインストールされたEC2インスタンスの自動デプロイ
- コスト最適化のためのスケジュール設定（開始：日本時間午前8時、日〜木曜日、停止：日本時間午後4時、月〜金曜日）
- VPC、サブネット、セキュリティグループを使用した安全なネットワーク設定
- EC2インスタンスとEventBridge用のIAMロールとポリシー
- AWS Systems Managerとの統合によるインスタンス管理の簡素化
- LiteLLMを通じた様々な言語モデルのサポート

## 📁 プロジェクト構造

```
s17-docker-ec2-litellm-server/
├─ modules/
│  ├─ compute/
│  ├─ iam/
│  ├─ networking/
├─ scripts/
│  ├─ setup_script.sh
├─ main.tf
├─ variables.tf
├─ outputs.tf
├─ providers.tf
├─ terraform.tfvars
├─ README.md
```

## 🚀 はじめ方

### 前提条件

- AWSアカウント
- Terraformがインストールされていること
- AWS CLIが設定されていること

### デプロイ手順

1. リポジトリをクローンします：
   ```
   git clone https://github.com/your-repo/s17-docker-ec2-litellm-server.git
   cd s17-docker-ec2-litellm-server
   ```

2. `terraform.tfvars` ファイルを特定の値で更新します：
   ```
   aws_region         = "ap-northeast-1"
   project_name       = "litellm-server"
   vpc_cidr           = "10.0.0.0/16"
   public_subnet_cidr = "10.0.2.0/24"
   ami_id             = "ami-0d52744d6551d851e"
   instance_type      = "t3.medium"
   key_name           = "your-key-pair-name"
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

## 📊 LiteLLMサーバーの特徴

このプロジェクトでデプロイされるLiteLLMサーバーは以下の機能を提供します：

- AWS BedrockやCloud AIサービスを含む様々な言語モデルに対する統一されたインターフェース
- RESTful APIを通じたカスタムアプリケーションとの容易な統合
- モデルの切り替えとフォールバックオプションのサポート
- カスタマイズ可能なリクエスト/レスポンス処理とキャッシング
- モニタリングとロギング機能

> [!NOTE]
> litellmの初期化のための下記のコマンドを実行してください
> 
> `sudo docker-compose exec litellm /bin/bash`
>
> `python db_scripts/create_views.py`


## 🔐 セキュリティ考慮事項

- EC2インスタンスはパブリックサブネットにデプロイされますが、セキュリティグループによってアクセスが制限されています
- IAMロールとポリシーを使用して、最小限の必要な権限のみを付与しています
- AWS Systems Managerを使用してインスタンス管理を行い、直接のSSHアクセスの必要性を減らしています

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
ssh -i "C:\Users\makim\.ssh\streamlit-terraform-keypair-tokyo-PEM.pem" ubuntu@i-0323e0aac64f073a7
```

## 📝 カスタマイズ

以下のファイルを修正することでプロジェクトをカスタマイズできます：

- `terraform.tfvars`: 変数の値を更新します
- `modules/compute/main.tf`: EC2インスタンスの設定とスケジューリングを調整します
- `modules/networking/main.tf`: VPCとセキュリティグループの設定を変更します
- `scripts/setup_script.sh`: EC2インスタンスのセットアッププロセスとLiteLLMサーバーの設定をカスタマイズします

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

- [Terraformドキュメント](https://www.terraform.io/docs/index.html)
- [AWSドキュメント](https://docs.aws.amazon.com/)
- [Dockerドキュメント](https://docs.docker.com/)
- [LiteLLMドキュメント](https://github.com/BerriAI/litellm)
