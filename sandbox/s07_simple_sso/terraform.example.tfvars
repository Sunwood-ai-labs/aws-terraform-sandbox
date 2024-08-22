# terraform.tfvars
#
# このファイルは、Terraformプロジェクトの変数に具体的な値を設定します。
# variables.tfで定義された変数に対応する値をここで指定します。
# 注意: このファイルには機密情報が含まれるため、バージョン管理システムにコミットしないでください。

aws_region        = "us-east-1"
aws_access_key    = "XXXXX"  # 実際のアクセスキーに置き換えてください
aws_secret_key    = "YYYYY"  # 実際のシークレットキーに置き換えてください
aws_session_token = "ZZZZZ"  # 実際のセッショントークンに置き換えてください

bucket_prefix = "ssotest-"

tags = {
  Environment = "Development"
  Project     = "S3-SSO-Access"
  Owner       = "MakiMaki"
}
