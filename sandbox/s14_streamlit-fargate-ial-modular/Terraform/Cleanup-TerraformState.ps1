# Final-Cleanup-TargetGroup.ps1

$AWS_REGION = "ap-northeast-1"
$ErrorActionPreference = "Stop"

function Remove-TargetGroup {
    param (
        [string]$TargetGroupName
    )
    try {
        $TG_ARN = aws elbv2 describe-target-groups --names $TargetGroupName --query 'TargetGroups[0].TargetGroupArn' --output text --region $AWS_REGION
        if ($TG_ARN -and $TG_ARN -ne "None") {
            Write-Host "ターゲットグループを削除中: $TargetGroupName"
            aws elbv2 delete-target-group --target-group-arn $TG_ARN --region $AWS_REGION
            
            # 削除の確認
            Start-Sleep -Seconds 10  # AWSのリソース更新を待つ
            $CheckTG = aws elbv2 describe-target-groups --names $TargetGroupName --query 'TargetGroups[0].TargetGroupArn' --output text --region $AWS_REGION
            if ($CheckTG -eq "None") {
                Write-Host "ターゲットグループを正常に削除しました: $TargetGroupName"
            } else {
                throw "ターゲットグループの削除に失敗しました: $TargetGroupName"
            }
        } else {
            Write-Host "ターゲットグループが見つかりませんでした: $TargetGroupName"
        }
    } catch {
        throw "エラー: ターゲットグループ $TargetGroupName の削除中にエラーが発生しました: $_"
    }
}

try {
    # ターゲットグループを削除
    Remove-TargetGroup -TargetGroupName "nekoneko-app-tg"

    # Terraformの状態を更新
    Write-Host "Terraformの状態を更新中..."
    terraform refresh

    # Terraformプランを表示
    Write-Host "Terraformプランを表示中..."
    terraform plan

    $response = Read-Host "プランを適用しますか？ (y/n)"
    if ($response -eq 'y') {
        # Terraformを適用
        Write-Host "Terraformを適用中..."
        terraform apply -auto-approve
    } else {
        Write-Host "操作をキャンセルしました。"
    }

    Write-Host "操作が完了しました。"
} catch {
    Write-Host "エラーが発生しました: $_"
}
