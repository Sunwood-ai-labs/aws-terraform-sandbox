# File: terraform.tfvars
# Purpose: Variable values specific to the project
# This file contains the actual values for the variables defined in variables.tf.
# It allows for easy customization of the deployment for different environments or projects.

aws_region           = "ap-northeast-1"
project_name         = "simple-lambda-demo"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
private_subnet_cidr  = "10.0.2.0/24"
lambda_function_name = "simple-lambda-demo_test_lambda"
environment          = "dev"
