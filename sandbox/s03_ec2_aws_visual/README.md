![](https://raw.githubusercontent.com/Sunwood-ai-labs/aws-terraform-sandbox/main/docs/USAGE_04.png)

# EC2 AWS Visual Sandbox

AWSリソースを作成し、視覚化するサンドボックス環境です。

## 特徴

- EC2インスタンスと関連リソースの自動デプロイ
- AWSインフラストラクチャの可視化

## 使用方法

1. Terraformでリソースをデプロイ:
```
terraform init
terraform apply
```

2. Dockerで可視化環境を起動:
```
docker-compose up -d
docker-compose exec terraform-visualizer /bin/bash
```

3. 可視化ツールを実行:
```
python aws_terraform_visualizer3.py
```

4. 終了時にリソースを削除:
```
terraform destroy
```

## カスタマイズ

`terraform.tfvars`を編集して設定をカスタマイズできます。

## 注意事項

- 学習用環境です。本番利用は推奨しません。
- AWSの課金に注意してください。
