# AWSリソース削除用PowerShellスクリプト

# AWSリージョンを設定
$AWS_REGION = "ap-northeast-1"

# エラーが発生した場合にスクリプトを停止
$ErrorActionPreference = "Stop"

try {
    # ALBのARNを取得
    Write-Host "ALBのARNを取得中..."
    $ALB_ARN = aws elbv2 describe-load-balancers --names nekoneko-app-alb --query 'LoadBalancers[0].LoadBalancerArn' --output text --region $AWS_REGION
    
    if ($ALB_ARN) {
        # ALBを削除
        Write-Host "ALBを削除中: $ALB_ARN"
        aws elbv2 delete-load-balancer --load-balancer-arn $ALB_ARN --region $AWS_REGION
        Write-Host "ALBの削除が完了しました。"
    } else {
        Write-Host "ALBが見つかりませんでした。"
    }

    # ターゲットグループのARNを取得
    Write-Host "ターゲットグループのARNを取得中..."
    $TG_ARN = aws elbv2 describe-target-groups --names nekoneko-app-tg --query 'TargetGroups[0].TargetGroupArn' --output text --region $AWS_REGION
    
    if ($TG_ARN) {
        # ターゲットグループを削除
        Write-Host "ターゲットグループを削除中: $TG_ARN"
        aws elbv2 delete-target-group --target-group-arn $TG_ARN --region $AWS_REGION
        Write-Host "ターゲットグループの削除が完了しました。"
    } else {
        Write-Host "ターゲットグループが見つかりませんでした。"
    }

    # ECS実行ロールを削除
    Write-Host "ECS実行ロールを削除中..."
    aws iam delete-role --role-name nekoneko-app-ecs-execution-role --region $AWS_REGION
    Write-Host "ECS実行ロールの削除が完了しました。"

    # CloudWatchロールを削除
    Write-Host "CloudWatchロールを削除中..."
    aws iam delete-role --role-name nekoneko-app-cloudwatch-role --region $AWS_REGION
    Write-Host "CloudWatchロールの削除が完了しました。"

    Write-Host "すべてのリソースの削除が完了しました。"
    
    # Terraformの状態をリフレッシュ
    Write-Host "Terraformの状態をリフレッシュ中..."
    terraform refresh
    
    # Terraformを適用
    Write-Host "Terraformを適用中..."
    terraform apply
} catch {
    Write-Host "エラーが発生しました: $_"
}
