# main.tf

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"
  
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  app_name           = var.app_name
}

module "security" {
  source = "./modules/security"
  
  app_name       = var.app_name
  vpc_id         = module.network.vpc_id
  container_port = var.container_port
}

module "alb" {
  source = "./modules/alb"
  
  app_name          = var.app_name
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
  container_port    = var.container_port
}

module "ecs" {
  source = "./modules/ecs"
  
  app_name             = var.app_name
  vpc_id               = module.network.vpc_id
  public_subnet_ids    = module.network.public_subnet_ids
  ecs_sg_id            = module.security.ecs_sg_id
  alb_target_group_arn = module.alb.target_group_arn
  container_image      = var.container_image
  container_port       = var.container_port
  desired_count        = var.desired_count
  task_cpu             = var.task_cpu
  task_memory          = var.task_memory
  aws_region           = var.aws_region
}

# スケジューラモジュールは一旦除外します
# module "scheduler" {
#   source = "./modules/scheduler"
#   
#   app_name              = var.app_name
#   ecs_cluster_name      = module.ecs.cluster_name
#   ecs_task_definition_arn = module.ecs.task_definition_arn
#   schedule_start_time   = var.schedule_start_time
#   schedule_stop_time    = var.schedule_stop_time
#   desired_count         = var.desired_count
# }
