## aws-terraform-sandbox

<p align="center">
<img src="https://huggingface.co/datasets/MakiAi/IconAssets/resolve/main/aws-terraform-sandbox.png" width="100%">
<br>
<h1 align="center">aws-terraform-sandbox</h1>
<h2 align="center">
  ～ Building Cloud Infrastructures, Block by Block ～
<br>
  <img alt="GitHub Last Commit" src="https://img.shields.io/github/last-commit/Sunwood-ai-labs/aws-terraform-sandbox">
  <img alt="GitHub Top Language" src="https://img.shields.io/github/languages/top/Sunwood-ai-labs/aws-terraform-sandbox">
  <img alt="License" src="https://img.shields.io/github/license/Sunwood-ai-labs/aws-terraform-sandbox">
  <br>
  <a href="https://github.com/Sunwood-ai-labs/aws-terraform-sandbox" title="Go to GitHub repo"><img src="https://img.shields.io/static/v1?label=Sunwood-ai-labs&message=aws-terraform-sandbox&color=blue&logo=github"></a>
  <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/Sunwood-ai-labs/aws-terraform-sandbox?style=social">
  <a href="https://github.com/Sunwood-ai-labs/aws-terraform-sandbox"><img alt="GitHub forks" src="https://img.shields.io/github/forks/Sunwood-ai-labs/aws-terraform-sandbox?style=social"></a>
<br>
<p align="center">
  <a href="https://hamaruki.com/"><b>[🌐 Website]</b></a> •
  <a href="https://github.com/Sunwood-ai-labs"><b>[🐱 GitHub]</b></a> •
  <a href="https://x.com/hAru_mAki_ch"><b>[🐦 Twitter]</b></a> •
  <a href="https://hamaruki.com/"><b>[🍀 Official Blog]</b></a>
   <br>

   <a href="https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/blob/main/README.md"><img src="https://img.shields.io/badge/ドキュメント-日本語-white.svg" alt="JA doc"/></a>
   <a href="https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/blob/main/docs/README.en.md"><img src="https://img.shields.io/badge/english-document-white.svg" alt="EN doc"></a>
</p>

</h2>

</p>

>[!IMPORTANT]
> This repository's release notes, README, and commit messages are primarily generated using [claude.ai](https://claude.ai/) and [ChatGPT4](https://chatgpt.com/) through the following AI tools: [AIRA](https://github.com/Sunwood-ai-labs/AIRA), [SourceSage](https://github.com/Sunwood-ai-labs/SourceSage), [Gaiah](https://github.com/Sunwood-ai-labs/Gaiah), and [HarmonAI_II](https://github.com/Sunwood-ai-labs/HarmonAI_II).

## 🌟 Getting Started

**aws-terraform-sandbox** is an experimental platform for automating and managing AWS cloud infrastructure using Terraform. This repository aims to facilitate learning by creating Terraform scripts using generative AI and experimenting with cloud infrastructure building.

It provides various Terraform templates and scripts for safe experimentation within a real AWS environment. It also includes guidelines for using generative AI to design and implement infrastructure.

## 🚀 Let's Get Started

1. Clone the repository:
   ```
   git clone https://github.com/Sunwood-ai-labs/aws-terraform-sandbox.git
   cd aws-terraform-sandbox
   ```

2. Install the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and configure your credentials.

3. Install [Terraform](https://developer.hashicorp.com/terraform/install).

4. Navigate to the desired sandbox environment:
   ```
   cd sandbox/s01_streamlit_aws_setup
   ```

5. Initialize and run Terraform:
   ```
   terraform init
   terraform apply
   ```

6. When prompted, type `yes` to confirm.

7. After deployment is complete, access the public IP address that is outputted to view your Streamlit application.

8. When finished, be sure to run the following command to delete your resources:
   ```
   terraform destroy
   ```
   Type `yes` when prompted for confirmation.

> [!WARNING]
> The `terraform destroy` command will delete all AWS resources that you have created. Before running it, ensure that there is no data you wish to keep.

## 📂 Project Structure

```
aws-terraform-sandbox/
├─ sandbox/
│  ├─ s01_streamlit_aws_setup/
│  ├─ s02_streamlit_aws_deployer/
│  ├─ s03_ec2_aws_visual/
│  ├─ s04_simple_lambda/
│  │  ├─ lambda/
│  │  │  ├─ test/
│  │  │  │  ├─ src/
│  │  │  │  │  ├─ test_terraform.py
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ terraform.tfvars
│  │  ├─ client.py
│  ├─ s05_api_lambda/
│  │  ├─ lambda/
│  │  │  ├─ test/
│  │  │  │  ├─ src/
│  │  │  │  │  ├─ test_terraform.py
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ terraform.tfvars
│  │  ├─ client.py
│  ├─ s06_fastapi_lambda/
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ Dockerfile
│  │  ├─ lambda_tester_api.py
│  │  ├─ terraform.tfvars
│  │  ├─ requirements.txt
│  │  ├─ app.py
│  │  ├─ lambda_tester_local.py
│  ├─ s07_simple_sso/
│  │  ├─ terraform.example.tfvars
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ README.md
│  ├─ s08_ec2_docker/
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ terraform.tfvars
│  ├─ s09-ec2-docker-moa/
│  │  ├─ variables.tf
│  │  ├─ setup_script.sh
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ terraform.tfvars
│  ├─ s10-docker-ec2-scheduler-moa/
│  │  ├─ scripts/
│  │  │  ├─ setup_script.sh
│  │  ├─ modules/
│  │  │  ├─ networking/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ outputs.tf
│  │  │  │  ├─ main.tf
│  │  │  ├─ compute/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ outputs.tf
│  │  │  │  ├─ main.tf
│  │  │  ├─ iam/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ outputs.tf
│  │  │  │  ├─ main.tf
│  │  ├─ variables.tf
│  │  ├─ outputs.tf
│  │  ├─ main.tf
│  │  ├─ providers.tf
│  │  ├─ README.md
│  │  ├─ terraform.tfvars
│  ├─ s11_streamlit-fargate/
│  │  ├─ app.py
│  │  ├─ Dockerfile
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ requirements.txt
│  ├─ s13_streamlit-fargate-ial/
│  │  ├─ outputs.tf
│  │  ├─ Dockerfile
│  │  ├─ main.tf
│  │  ├─ README.md
│  │  ├─ terraform.tfvars
│  │  ├─ app.py
│  │  ├─ variables.tf
│  │  ├─ requirements.txt
│  ├─ s14_streamlit-fargate-ial-modular/
│  │  ├─ Terraform/
│  │  │  ├─ modules/
│  │  │  │  ├─ alb/
│  │  │  │  │  ├─ variables.tf
│  │  │  │  │  ├─ main.tf
│  │  │  │  │  ├─ outputs.tf
│  │  │  │  ├─ ecs/
│  │  │  │  │  ├─ variables.tf
│  │  │  │  │  ├─ main.tf
│  │  │  │  │  ├─ outputs.tf
│  │  │  │  ├─ scheduler/
│  │  │  │  │  ├─ variables.tf
│  │  │  │  │  ├─ main.tf
│  │  │  │  ├─ security/
│  │  │  │  │  ├─ variables.tf
│  │  │  │  │  ├─ main.tf
│  │  │  │  │  ├─ outputs.tf
│  │  │  │  ├─ network/
│  │  │  │  │  ├─ variables.tf
│  │  │  │  │  ├─ main.tf
│  │  │  │  │  ├─ outputs.tf
│  │  │  ├─ script/
│  │  │  │  ├─ Cleanup-AWSResources.ps1
│  │  │  │  ├─ Cleanup-AWSResources2.ps1
│  │  │  ├─ terraform.tfvars
│  │  │  ├─ variables.tf
│  │  │  ├─ main.tf
│  │  │  ├─ Cleanup-TerraformState.ps1
│  │  │  ├─ outputs.tf
│  │  ├─ app.py
│  │  ├─ requirements.txt
│  │  ├─ Dockerfile
│  │  ├─ README.md
│  ├─ s15_streamlit-fargate-whitelist/
│  │  ├─ script/
│  │  │  ├─ update-fargate-image.ps1
│  │  ├─ Terraform/
│  │  │  ├─ terraform.tfvars
│  │  │  ├─ variables.tf
│  │  │  ├─ main.tf
│  │  │  ├─ whitelist.csv
│  │  │  ├─ outputs.tf
│  │  ├─ app.py
│  │  ├─ requirements.txt
│  │  ├─ Dockerfile
│  │  ├─ README.md
│  ├─ s16_neko-neko-ai-fargate/
│  │  ├─ script/
│  │  │  ├─ update-fargate-image.ps1
│  │  ├─ pages/
│  │  │  ├─ ReleaseNotes.py
│  │  │  ├─ README.py
│  │  ├─ Terraform/
│  │  │  ├─ terraform.tfvars
│  │  │  ├─ variables.tf
│  │  │  ├─ main.tf
│  │  │  ├─ whitelist.csv
│  │  │  ├─ outputs.tf
│  │  ├─ app.py
│  │  ├─ requirements.txt
│  │  ├─ Dockerfile
│  │  ├─ README.md
│  ├─ s11-docker-ec2-scheduler-moa-update/
│  │  ├─ modules/
│  │  │  ├─ compute/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ iam/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ networking/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  ├─ scripts/
│  │  │  ├─ setup_script.sh
│  │  ├─ providers.tf
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ outputs.tf
│  ├─ s18-docker-ec2-gitlab/
│  │  ├─ modules/
│  │  │  ├─ compute/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ iam/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ networking/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  ├─ scripts/
│  │  │  ├─ setup_script.sh
│  │  ├─ providers.tf
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ docker-compose.yml
│  │  ├─ whitelist.csv
│  │  ├─ outputs.tf
│  ├─ s11_streamlit-fargate/
│  │  ├─ app.py
│  │  ├─ requirements.txt
│  │  ├─ Dockerfile
│  │  ├─ README.md
│  │  ├─ main.tf
│  ├─ s04_simple_lambda/
│  │  ├─ lambda/
│  │  │  ├─ test/
│  │  │  │  ├─ src/
│  │  │  │  │  ├─ test_terraform.py
│  │  ├─ client.py
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  ├─ s09-ec2-docker-moa/
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ setup_script.sh
│  │  ├─ main.tf
│  ├─ s13_streamlit-fargate-ial/
│  │  ├─ Terraform/
│  │  │  ├─ terraform.tfvars
│  │  │  ├─ variables.tf
│  │  │  ├─ main.tf
│  │  │  ├─ outputs.tf
│  │  ├─ app.py
│  │  ├─ requirements.txt
│  │  ├─ Dockerfile
│  │  ├─ README.md
│  ├─ s01_streamlit_aws_setup/
│  │  ├─ terraform.tfstate
│  │  ├─ streamlit_aws_setup.tf
│  ├─ s06_fastapi_lambda/
│  │  ├─ app.py
│  │  ├─ requirements.txt
│  │  ├─ Dockerfile
│  │  ├─ lambda_tester_local.py
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ lambda_tester_api.py
│  ├─ s03_ec2_aws_visual/
│  │  ├─ aws-infrastructure-diagram.py
│  │  ├─ Dockerfile
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ aws_terraform_visualizer3.py
│  │  ├─ main.tf
│  │  ├─ docker-compose.yml
│  │  ├─ terraform_vis_prompt_generator.py
│  ├─ s17-docker-ec2-litellm-server/
│  │  ├─ modules/
│  │  │  ├─ compute/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ iam/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ networking/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  ├─ scripts/
│  │  │  ├─ setup_script.sh
│  │  ├─ providers.tf
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ whitelist.csv
│  │  ├─ outputs.tf
│  ├─ s05_api_lambda/
│  │  ├─ lambda/
│  │  │  ├─ test/
│  │  │  │  ├─ src/
│  │  │  │  │  ├─ test_terraform.py
│  │  ├─ client.py
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  ├─ s02_streamlit_aws_deployer/
│  │  ├─ terraform.tfstate
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  ├─ s10-docker-ec2-scheduler-moa/
│  │  ├─ modules/
│  │  │  ├─ compute/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ iam/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  │  ├─ networking/
│  │  │  │  ├─ variables.tf
│  │  │  │  ├─ main.tf
│  │  │  │  ├─ outputs.tf
│  │  ├─ scripts/
│  │  │  ├─ setup_script.sh
│  │  ├─ providers.tf
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ outputs.tf
│  ├─ s08_ec2_docker/
│  │  ├─ terraform.tfvars
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  ├─ s07_simple_sso/
│  │  ├─ README.md
│  │  ├─ variables.tf
│  │  ├─ terraform.example.tfvars
│  │  ├─ main.tf
│  ├─ README.md
├─ issue_creator.log
├─ pyproject.toml
├─ README.md
```

## 🛠 Sandbox Environments

This repository contains the following sandbox environments:

1. **s01_streamlit_aws_setup**: Sets up AWS infrastructure to deploy a basic Streamlit application.

2. **s02_streamlit_aws_deployer**: Deploys a Streamlit application with more advanced settings, including an automatic startup/shutdown schedule, and sets up AWS infrastructure.

3. **s03_ec2_aws_visual**: Creates an EC2 instance and its associated resources (VPC, subnets, security groups, etc.) and provides tools for visualizing them.
    - 🎉 **EC2 Instance and Related Resource Visualization Features**
    - 🎉 **Automatic Generation of AWS Configuration Diagrams Using Generative AI**

4. **s04_simple_lambda**: Added a sandbox environment for deploying and managing simple Lambda functions.

5. **s05_api_lambda**: Added a deployment environment for serverless APIs integrating API Gateway and Lambda functions.

6. **s06_fastapi_lambda**: Provides an environment for deploying FastAPI using AWS Lambda and API Gateway.
    - 🎉 **Added FastAPI Serverless API Sandbox Environment** 🟢
    - 🎉 **Added functionality to invoke Lambda functions locally** 🟢
    - 🚀 **Introduced variables into Terraform scripts** 🟢
    - 🚀 **Added a Python script for invoking Lambda functions** 🟢
    - 🚀 **Changed to invoke Lambda functions using the API Gateway URL** 🟢

7. **s07_simple_sso**: Added a sandbox environment for easier S3 bucket creation and access management by SSO users. 🟢
    - You can customize the bucket name prefix and tags in `variables.tf`.
    - Configuration examples are provided in `terraform.tfvars.example`.
    - `main.tf` creates the S3 bucket and applies tags.
    - `README.md` describes how to use and configure the environment.

8. **s08_ec2_docker**: Added a sandbox environment for building Docker environments on AWS EC2 instances.
    - 🎉 **Added `s08_ec2_docker` Sandbox Environment** 🟢
    - Provides Terraform settings to automatically install Docker and Docker Compose on an EC2 instance.
    - Offers secure network settings using a private subnet and NAT gateway.
    - Provides secure access to EC2 instances through Systems Manager.
    - `README.md` includes details on environment setup and usage.
    - You can customize environment settings in `terraform.tfvars`.

9. **s09-ec2-docker-moa**: Added a sandbox environment for deploying Docker environments and MOA projects on AWS EC2 instances.
    - 🎉 **Added `s09-ec2-docker-moa` Sandbox Environment** 🟢
    - Automatically installs Docker and Docker Compose on an EC2 instance to set up the MOA project.
    - `README.md` includes details on environment setup and usage.
    - You can customize environment settings in `terraform.tfvars`.

10. **s10-docker-ec2-scheduler-moa**: Added a sandbox environment for deploying MOA projects on AWS EC2 instances with scheduled start and stop times.
    - 🎉 **Added `s10-docker-ec2-scheduler-moa` Sandbox Environment** 🟢
    - Automatically deploys an EC2 instance with Docker and MOA preinstalled.
    - Implements a scheduler to automatically start and stop the EC2 instance.
    - Makes it easy to try AWS Bedrock and Cloud AI services.
    - `README.md` includes details on environment setup and usage.
    - You can customize environment settings in `terraform.tfvars`.

11. **s11_streamlit-fargate**: Provides an environment for deploying Streamlit applications on AWS Fargate.
    - 🎉 **Added `s11_streamlit-fargate` Sandbox Environment** 🟢
    - Uses Docker to containerize the Streamlit application.
    - Deploys the container on AWS Fargate to build a scalable environment.
    - Distributes traffic using an Application Load Balancer.
    - Provides secure network settings using VPC and security groups.
    - Automatically sets up ECS clusters and task definitions.

12. **s13_streamlit-fargate-ial**: Provides an environment for deploying Streamlit applications on AWS Fargate.
    - 🎉 **Added `s13_streamlit-fargate-ial` Sandbox Environment** 🟢
    - Uses Docker to containerize the Streamlit application.
    - Deploys the container on AWS Fargate to build a scalable environment.
    - Distributes traffic using an Application Load Balancer.
    - Provides secure network settings using VPC and security groups.
    - Automatically sets up ECS clusters and task definitions.
    - Creates a Neko Cafe dashboard application and provides an example of creating it with Streamlit and deploying it using AWS Fargate and ECS.

13. **s14_streamlit-fargate-ial-modular**: Added a sandbox environment for deploying Streamlit applications on AWS Fargate and managing infrastructure using modularized Terraform code.
    - 🎉 **Added `s14_streamlit-fargate-ial-modular` Sandbox Environment** 🟢
    - Uses modules to manage infrastructure components like networks, security, ALB, and ECS separately.
    - Introduces IP whitelist functionality to restrict access to ALB.
    - Simplifies building continuous integration and continuous delivery (CI/CD) pipelines.

14. **s15_streamlit-fargate-whitelist**: Provides an environment for deploying Streamlit applications on AWS Fargate with added IP whitelist functionality.
    - 🎉 **Added `s15_streamlit-fargate-whitelist` Sandbox Environment** 🟢
    - Uses Docker to containerize the Streamlit application.
    - Deploys the container on AWS Fargate to build a scalable environment.
    - Distributes traffic using an Application Load Balancer.
    - Provides secure network settings using VPC and security groups.
    - Automatically sets up ECS clusters and task definitions.
    - Introduces IP whitelist functionality to restrict access to ALB.
    - Allows updating Fargate images using PowerShell scripts.

15. **s16_neko-neko-ai-fargate**: Provides an environment for deploying Streamlit applications on AWS Fargate with added IP whitelist functionality.
    - 🎉 **Added `s16_neko-neko-ai-fargate` Sandbox Environment** 🟢
    - Uses Docker to containerize the Streamlit application.
    - Deploys the container on AWS Fargate to build a scalable environment.
    - Distributes traffic using an Application Load Balancer.
    - Provides secure network settings using VPC and security groups.
    - Automatically sets up ECS clusters and task definitions.
    - Introduces IP whitelist functionality to restrict access to ALB.
    - Allows updating Fargate images using PowerShell scripts.
    - Deployment environment for a Streamlit application that provides an AI assistant that interacts with users in a cat-like manner, utilizing the Claude-3-haiku model from AWS Bedrock.

16. **s17-docker-ec2-litellm-server**: Automatically deploys the LiteLLM server on AWS EC2.
    - 🎉 **Added `s17-docker-ec2-litellm-server` Sandbox Environment** 🟢
    - Automatically deploys an EC2 instance with Docker and LiteLLM preinstalled.
    - Cost optimization through scheduling (start: 8:00 AM Japan time, Sun-Thu; stop: 4:00 PM Japan time, Mon-Fri)
    - Secure network setup using VPC, subnets, and security groups
    - IAM roles and policies for EC2 instances and EventBridge
    - Simplified instance management integration with AWS Systems Manager
    - Support for various language models through LiteLLM

17. **s18-docker-ec2-gitlab**: Automatically deploys the GitLab server on AWS EC2.
    - 🎉 **Added `s18-docker-ec2-gitlab` Sandbox Environment** 🟢
    - Automatically deploys an EC2 instance with Docker and GitLab preinstalled.
    - Allows defining a whitelist of IP addresses authorized to access GitLab.
    - The `docker-compose.yml` file defines a backup service that automatically backs up the GitLab server.

For more information on each sandbox environment, please refer to [sandbox/README.md](sandbox/README.md).

## 📝 Update Information

- 🎉 [v2.5.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.5.0) : Added a new sandbox environment `s18-docker-ec2-gitlab` to automatically deploy the GitLab server. 🟢
- 🎉 [v2.4.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.4.0) : Added LiteLLM server initialization scripts for improved security and user experience. 🟢
- 🎉 [v2.3.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.3.0) : Added `s16_neko-neko-ai-fargate` sandbox environment, improved `s14_streamlit-fargate-ial-modular`, and updated documentation. 🟢
- 🎉 [v2.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.2.0) : Added `s15_streamlit-fargate-whitelist` sandbox environment and updated documentation. 🟢
- 🎉 [v2.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.1.0) : Improved `s13_streamlit-fargate-ial` sandbox environment and updated documentation. 🟢
- 🎉 [v2.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.0.0) : Added MOA project deployment functionality, Gemini-1.5-flash model, and implemented EC2 scheduler. 🟢
- 🎉 [v1.10.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.10.0) : Added `s08_ec2_docker` sandbox environment for building Docker environments on AWS EC2 instances. 🟢
- 🎉 [v1.9.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.9.1) : Added `s07_simple_sso` sandbox environment for easier S3 bucket creation and access management by SSO users. 🟢
- 🎉 [v1.8.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.8.0) : Provides an environment for deploying FastAPI using AWS Lambda and API Gateway. 🟢
- 🎉 [v1.7.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.7.0) : Added `s05_api_lambda` sandbox environment, a deployment environment for serverless APIs integrating API Gateway and Lambda functions. 🟢
- 🎉 [v1.6.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.6.0) : Added a sandbox environment for deploying and managing simple Lambda functions. 🟢
- 🎉 [v1.5.0](https://github.com/Sunwood-ai-labs/AlphaExperiment/releases/tag/v1.11.1) : Added EC2 instance and related resource visualization features, generative
```