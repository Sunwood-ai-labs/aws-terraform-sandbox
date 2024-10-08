# AWSリージョン
aws_region = "ap-northeast-1"

# アプリケーション名
app_name = "nekoneko-app"

# VPCのCIDRブロック
vpc_cidr = "10.0.0.0/16"

# 使用するアベイラビリティゾーン
availability_zones = ["ap-northeast-1a", "ap-northeast-1c"]

# パブリックサブネットのCIDRブロック
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

# ALBにアクセスを許可するIPアドレスのリスト
# 注: この設定は使用されていません。代わりにCSVファイルからホワイトリストを読み込んでいます。
# whitelist_ips = ["203.0.113.0/24"]

# 使用するコンテナイメージ
container_image = "makisunwood/nekoneko-app:latest"

# コンテナのポート
container_port = 8501

# ECSサービスのデフォルトのタスク数
desired_count = 2

# サービス開始時刻（cron形式）
schedule_start_time = "cron(0 23 ? * SUN-THU *)"

# サービス停止時刻（cron形式）
schedule_stop_time = "cron(0 10 ? * MON-FRI *)"

# タスクのCPU（単位：vCPU）
task_cpu = "256"

# タスクのメモリ（単位：MiB）
task_memory = "512"
