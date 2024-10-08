# 🐱 ねこねこカンパニー 工場ダッシュボード: AWS Fargate上のStreamlitアプリケーション（ホワイトリスト機能付き）

![Architecture Diagram](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE_03.png)

このプロジェクトは、AWS FargateとECSを使用してStreamlitで作成されたねこねこカンパニーの工場ダッシュボードアプリケーションをデプロイします。Terraformを使用してインフラストラクチャをコード化し、IPホワイトリスト機能を実装しています。

## 🎯 プロジェクトの目的

- StreamlitアプリケーションをAWS Fargateにデプロイする
- Terraformを使用してAWSリソースを自動的にプロビジョニングする
- コンテナ化されたアプリケーションの簡単なデプロイと管理を実現する
- IPホワイトリストによるセキュアなアクセス制御を実装する

## 🌟 主な特徴

- StreamlitとPlotlyを使用した対話的な工場ダッシュボード
- DockerコンテナとしてパッケージングされたStreamlitアプリケーション
- AWS FargateとECSを使用したサーバーレスデプロイメント
- Application Load Balancerを使用した高可用性と負荷分散
- Terraformを使用したインフラストラクチャのコード化
- CSVファイルを使用したIPホワイトリスト機能

## 📁 プロジェクト構造

```
s15_streamlit-fargate-whitelist/
├─ script/
│  ├─ update-fargate-image.ps1
├─ Terraform/
│  ├─ main.tf
│  ├─ outputs.tf
│  ├─ terraform.tfvars
│  ├─ variables.tf
│  ├─ whitelist.csv
├─ .streamlit/
│  ├─ config.toml
├─ app.py
├─ Dockerfile
├─ README.md
├─ requirements.txt
```

## 🚀 はじめ方

### 前提条件

- AWSアカウント
- Terraformがインストールされていること
- AWS CLIが設定されていること
- Dockerがインストールされていること

### デプロイ手順

1. リポジトリをクローンします：
   ```
   git clone https://github.com/your-repo/s15_streamlit-fargate-whitelist.git
   cd s15_streamlit-fargate-whitelist
   ```

2. Dockerイメージをビルドします：
   ```
   docker build -t nyanko-cafe-app .
   ```

3. イメージをAmazon ECRにプッシュします：

   a. ECRリポジトリを作成：
   ```
   aws ecr create-repository --repository-name nyanko-cafe-app --region ap-northeast-1
   ```

   b. ECRにログイン：
   ```
   aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin <YOUR-ACCOUNT-ID>.dkr.ecr.ap-northeast-1.amazonaws.com
   ```

   c. イメージにタグを付ける：
   ```
   docker tag nyanko-cafe-app:latest <YOUR-ACCOUNT-ID>.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest
   ```

   d. ECRにイメージをプッシュ：
   ```
   docker push <YOUR-ACCOUNT-ID>.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest
   ```

4. `Terraform/terraform.tfvars` ファイルを更新します：

   ```
   aws_region      = "ap-northeast-1"
   project_name    = "streamlit-nyanko-cafe"
   vpc_cidr        = "10.0.0.0/16"
   container_image = "<YOUR-ACCOUNT-ID>.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest"
   task_cpu        = "256"
   task_memory     = "512"
   app_count       = 1
   ```

5. `Terraform/whitelist.csv` ファイルを編集して、許可するIPアドレスを設定します：

   ```
   ip,description
   203.0.113.0/24,Client demo network
   193.186.4.177/32,Office network
   ```

6. Terraformを初期化し、適用します：
   ```
   cd Terraform
   terraform init
   terraform plan
   terraform apply
   ```

7. デプロイが完了したら、出力されたALBのDNS名を使用してアプリケーションにアクセスできます。

## 📊 アプリケーションの特徴

- 生産状況のグラフ表示
- 品質管理データの可視化
- 在庫状況の棒グラフ
- 従業員効率と機械稼働率の表示
- 受注と出荷データの時系列表示

## 🔐 セキュリティ考慮事項

- VPC、サブネット、セキュリティグループを使用した安全なネットワーク設定
- ALBとECSタスク用の適切に設定されたセキュリティグループ
- IAMロールとポリシーを使用した最小権限の原則の適用
- CSVファイルを使用したIPホワイトリスト機能による接続制限

## 📝 カスタマイズ

- `app.py`: Streamlitアプリケーションのコードを修正してダッシュボードをカスタマイズ
- `Terraform/main.tf`: AWSリソースの設定を調整
- `Terraform/variables.tf` と `Terraform/terraform.tfvars`: 変数の値を更新
- `Terraform/whitelist.csv`: 許可するIPアドレスを追加または削除

## 🧹 クリーンアップ

作成したすべてのリソースを削除するには：

```
terraform destroy
```

## 🔄 イメージの更新とデプロイ

アプリケーションを更新した後、新しいイメージをビルドしてデプロイする必要があります。この処理は手動で行うか、提供されているPowerShellスクリプトを使用して自動化できます。

### PowerShellスクリプトを使用した更新

`script/update-fargate-image.ps1`スクリプトを使用して、イメージのビルド、ECRへのプッシュ、およびECSサービスの更新を自動的に行うことができます。

スクリプトを使用するには：

1. PowerShellを管理者権限で開きます。
2. プロジェクトディレクトリに移動します。
3. 次のコマンドを実行します：

   ```powershell
   .\script\update-fargate-image.ps1
   ```

### 手動更新手順

PowerShellスクリプトを使用しない場合は、README.mdの「デプロイ手順」セクションに記載されている手順2〜4を実行し、その後ECSサービスを更新します。

## Docker Hubを使用したデプロイ方法

Amazon ECRの代わりにDocker Hubを使用してイメージをホストすることもできます。以下は、Docker Hubを使用したデプロイ手順です：

1. Docker Hubにログインします：
   ```
   docker login
   ```

2. イメージにタグを付けます：
   ```
   docker tag nyanko-cafe-app:latest your-dockerhub-username/nyanko-cafe-app:latest
   ```

3. Docker Hubにイメージをプッシュします：
   ```
   docker push your-dockerhub-username/nyanko-cafe-app:latest
   ```

4. `Terraform/terraform.tfvars` ファイルを更新して、Docker Hubのイメージを使用するように設定します：

   ```
   aws_region      = "ap-northeast-1"
   project_name    = "streamlit-nyanko-cafe"
   vpc_cidr        = "10.0.0.0/16"
   container_image = "your-dockerhub-username/nyanko-cafe-app:latest"
   task_cpu        = "256"
   task_memory     = "512"
   app_count       = 1
   ```

5. Terraformの適用手順は同じです。

注意: Docker Hubの公開リポジトリを使用する場合、イメージが公開されることに注意してください。プライベートリポジトリを使用する場合は、ECSタスク実行ロールにDocker Hubの認証情報を提供する必要があります。



## 🤝 貢献

貢献を歓迎します！お気軽にPull Requestを提出してください。

## 📜 ライセンス

このプロジェクトはMITライセンスの下でライセンスされています。

## 📚 追加リソース

- [Streamlitドキュメント](https://docs.streamlit.io/)
- [Terraformドキュメント](https://www.terraform.io/docs/index.html)
- [AWSドキュメント](https://docs.aws.amazon.com/)
- [Dockerドキュメント](https://docs.docker.com/)
