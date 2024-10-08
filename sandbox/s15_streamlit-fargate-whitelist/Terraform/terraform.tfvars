aws_region      = "ap-northeast-1"
project_name    = "streamlit-nyanko-cafe"
vpc_cidr        = "10.0.0.0/16"
# container_image = "makisunwood/nyanko-cafe-app:latest"
container_image = "498218886114.dkr.ecr.ap-northeast-1.amazonaws.com/nyanko-cafe-app:latest"
task_cpu        = "256"
task_memory     = "512"
app_count       = 1
