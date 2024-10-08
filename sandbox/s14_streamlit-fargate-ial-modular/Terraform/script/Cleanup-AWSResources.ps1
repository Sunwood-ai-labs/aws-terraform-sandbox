# Set your AWS region
$AWS_REGION = "ap-northeast-1"

# EventBridge Rules
$STOP_RULE = "nekoneko-app-stop-rule"
$START_RULE = "nekoneko-app-start-rule"

# ECS Cluster
$CLUSTER_NAME = "nekoneko-app-cluster"

# Function to remove targets from a rule and delete the rule
function Remove-Rule {
    param (
        [string]$ruleName
    )
    Write-Host "Removing targets and deleting rule: $ruleName"
    
    # List targets
    $targets = aws events list-targets-by-rule --rule $ruleName --region $AWS_REGION --query 'Targets[*].Id' --output text
    
    # Remove targets
    if ($targets) {
        aws events remove-targets --rule $ruleName --ids $targets --region $AWS_REGION
    }
    
    # Delete rule
    aws events delete-rule --name $ruleName --region $AWS_REGION
}

# Function to delete services in an ECS cluster
function Remove-EcsServices {
    param (
        [string]$cluster
    )
    Write-Host "Deleting services in cluster: $cluster"
    
    # List services
    $services = aws ecs list-services --cluster $cluster --region $AWS_REGION --query 'serviceArns[]' --output text
    
    # Delete each service
    foreach ($service in $services.Split()) {
        if ($service) {
            Write-Host "Deleting service: $service"
            aws ecs update-service --cluster $cluster --service $service --desired-count 0 --region $AWS_REGION
            aws ecs delete-service --cluster $cluster --service $service --region $AWS_REGION
        }
    }
}

# Delete EventBridge Rules
Remove-Rule -ruleName $STOP_RULE
Remove-Rule -ruleName $START_RULE

# Delete ECS Services and Cluster
Remove-EcsServices -cluster $CLUSTER_NAME

# Delete ECS Cluster
Write-Host "Deleting ECS cluster: $CLUSTER_NAME"
aws ecs delete-cluster --cluster $CLUSTER_NAME --region $AWS_REGION

Write-Host "Cleanup completed."
