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
>Nearly 90% of this repository's release notes, README, and commit messages are generated using [claude.ai](https://claude.ai/), [ChatGPT4](https://chatgpt.com/), and [AIRA](https://github.com/Sunwood-ai-labs/AIRA), [SourceSage](https://github.com/Sunwood-ai-labs/SourceSage), [Gaiah](https://github.com/Sunwood-ai-labs/Gaiah), [HarmonAI_II](https://github.com/Sunwood-ai-labs/HarmonAI_II).

## 🌟 Introduction

**aws-terraform-sandbox** is an experimental platform designed to automate and manage AWS cloud infrastructure using Terraform. This repository aims to learn by building cloud infrastructure using Terraform scripts generated with generative AI, allowing for experimentation and trial and error.

It offers various Terraform templates and scripts, enabling safe experimentation in real AWS environments. Additionally, it includes guidelines for using generative AI to design and implement infrastructure.

## 🚀 Getting Started

1. Clone the repository:
   ```
   git clone https://github.com/Sunwood-ai-labs/aws-terraform-sandbox.git
   cd aws-terraform-sandbox
   ```

2. Install the [AWS CLI](https://docs.aws.amazon.com/en_us/cli/latest/userguide/getting-started-install.html) and configure your credentials.

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

6. When prompted, enter `yes` to confirm.

7. Once deployment is complete, access the public IP address outputted to view the Streamlit application.

8. When finished, always remove the resources using the following command:
   ```
   terraform destroy
   ```
   Enter `yes` when prompted.

> [!WARNING]
> The `terraform destroy` command will delete all created AWS resources. Ensure you have no data you wish to retain before executing it.

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
│  ├─ README.md
├─ docs/
│  ├─ REQUIREMENTS_DEFINITION.md
├─ issue_creator.log
├─ README.md
├─ pyproject.toml
```

## 🛠 Sandbox Environments

This repository contains the following sandbox environments:

1. **s01_streamlit_aws_setup**: Sets up AWS infrastructure to deploy a basic Streamlit application.

2. **s02_streamlit_aws_deployer**: Deploys Streamlit applications with more advanced settings, including automatic startup/shutdown schedules, using AWS infrastructure.

3. **s03_ec2_aws_visual**: Creates an EC2 instance and its associated resources (VPC, subnets, security groups, etc.) and provides tools for visual representation.
    - 🎉 **Visualizes EC2 instances and related resources**
    - 🎉 **Automatically generates AWS architecture diagrams using generative AI**

4. **s04_simple_lambda**: Adds a sandbox environment for deploying and managing simple Lambda functions.

5. **s05_api_lambda**: Adds a deployment environment for serverless APIs integrating API Gateway and Lambda functions.

6. **s06_fastapi_lambda**: Provides an environment for deploying FastAPI using AWS Lambda and API Gateway.
    - 🎉 **Added FastAPI serverless API sandbox environment** 🟢
    - 🎉 **Added functionality to invoke Lambda functions locally** 🟢
    - 🚀 **Introduced variables to Terraform scripts** 🟢
    - 🚀 **Added Python scripts for invoking Lambda functions** 🟢
    - 🚀 **Modified to use API Gateway URLs to invoke Lambda functions** 🟢

7. **s07_simple_sso**: Adds a sandbox environment for easier S3 bucket creation and access control using SSO users 🟢
    - You can customize the S3 bucket name prefix and tags in `variables.tf`.
    - `terraform.tfvars.example` provides configuration examples.
    - `main.tf` creates the S3 bucket and applies tags.
    - `README.md` describes how to use and configure the environment.

8. **s08_ec2_docker**: Adds a sandbox environment for building Docker environments on AWS EC2 instances.
    - 🎉 **Added `s08_ec2_docker` sandbox environment** 🟢
    - Provides Terraform configuration to automatically install Docker and Docker Compose on EC2 instances.
    - Offers secure network configuration using private subnets and NAT Gateway.
    - Provides secure access to EC2 instances via Systems Manager.
    - `README.md` details environment setup and usage.
    - Environment settings can be customized in `terraform.tfvars`.

9. **s09-ec2-docker-moa**: Adds a sandbox environment for deploying Docker environments and MOA projects on AWS EC2 instances.
    - 🎉 **Added `s09-ec2-docker-moa` sandbox environment** 🟢
    - Automatically sets up MOA projects by installing Docker and Docker Compose on EC2 instances.
    - `README.md` details environment setup and usage.
    - Environment settings can be customized in `terraform.tfvars`.

10. **s10-docker-ec2-scheduler-moa**: Adds a sandbox environment for deploying MOA projects on AWS EC2 instances and setting scheduled start/stop times.
    - 🎉 **Added `s10-docker-ec2-scheduler-moa` sandbox environment** 🟢
    - Automatically deploys EC2 instances with Docker and MOA pre-installed.
    - Implements a scheduler to automatically start and stop EC2 instances.
    - Facilitates easy experimentation with AWS Bedrock and Cloud AI services.
    - `README.md` details environment setup and usage.
    - Environment settings can be customized in `terraform.tfvars`.

11. **s11_streamlit-fargate**: Provides an environment for deploying Streamlit applications on AWS Fargate.
    - 🎉 **Added `s11_streamlit-fargate` sandbox environment** 🟢
    - Containerizes Streamlit applications using Docker.
    - Deploys containers on AWS Fargate to build scalable environments.
    - Uses Application Load Balancer to distribute traffic.
    - Provides secure network settings using VPC and security groups.
    - Automatically sets up ECS clusters and task definitions.

12. **s13_streamlit-fargate-ial**: Provides an environment for deploying Streamlit applications on AWS Fargate.
    - 🎉 **Added `s13_streamlit-fargate-ial` sandbox environment** 🟢
    - Containerizes Streamlit applications using Docker.
    - Deploys containers on AWS Fargate to build scalable environments.
    - Uses Application Load Balancer to distribute traffic.
    - Provides secure network settings using VPC and security groups.
    - Automatically sets up ECS clusters and task definitions.
    - Creates a Nyan Cafe dashboard application as an example of deploying a Streamlit application created with AWS Fargate and ECS.

13. **s14_streamlit-fargate-ial-modular**: Adds a sandbox environment for deploying Streamlit applications on AWS Fargate and managing infrastructure using modularized Terraform code.
    - 🎉 **Added `s14_streamlit-fargate-ial-modular` sandbox environment** 🟢
    - Uses modules to separate and manage infrastructure components like networking, security, ALB, and ECS.
    - Introduces IP whitelisting functionality to restrict access to ALB.
    - Simplifies the construction of continuous integration and continuous delivery (CI/CD) pipelines.

14. **s15_streamlit-fargate-whitelist**: Provides an environment for deploying Streamlit applications on AWS Fargate with added IP whitelisting functionality.
    - 🎉 **Added `s15_streamlit-fargate-whitelist` sandbox environment** 🟢
    - Containerizes Streamlit applications using Docker.
    - Deploys containers on AWS Fargate to build scalable environments.
    - Uses Application Load Balancer to distribute traffic.
    - Provides secure network settings using VPC and security groups.
    - Automatically sets up ECS clusters and task definitions.
    - Introduces IP whitelisting functionality to restrict access to ALB.
    - Uses PowerShell scripts to update Fargate images.

15. **s16_neko-neko-ai-fargate**: Provides an environment for deploying Streamlit applications on AWS Fargate with added IP whitelisting functionality.
    - 🎉 **Added `s16_neko-neko-ai-fargate` sandbox environment** 🟢
    - Containerizes Streamlit applications using Docker.
    - Deploys containers on AWS Fargate to build scalable environments.
    - Uses Application Load Balancer to distribute traffic.
    - Provides secure network settings using VPC and security groups.
    - Automatically sets up ECS clusters and task definitions.
    - Introduces IP whitelisting functionality to restrict access to ALB.
    - Uses PowerShell scripts to update Fargate images.
    - Deployment environment for a Streamlit application that uses the Claude-3-haiku model from AWS Bedrock to provide an AI assistant that interacts with users in a cat-like tone.

For detailed information on each sandbox environment, refer to [sandbox/README.md](sandbox/README.md).

## 📝 Updates

- 🎉 [v2.3.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.3.0) : Added `s16_neko-neko-ai-fargate` sandbox environment, improved `s14_streamlit-fargate-ial-modular`, updated documentation 🟢
- 🎉 [v2.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.2.0) : Added `s15_streamlit-fargate-whitelist` sandbox environment and updated documentation 🟢
- 🎉 [v2.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.1.0) : Improved `s13_streamlit-fargate-ial` sandbox environment and updated documentation 🟢
- 🎉 [v2.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.0.0) : Added MOA project deployment functionality, Gemini-1.5-flash model, implemented EC2 scheduler, and more 🟢
- 🎉 [v1.10.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.10.0) : Added `s08_ec2_docker` sandbox environment for building Docker environments on AWS EC2 instances 🟢
- 🎉 [v1.9.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.9.1) : Added `s07_simple_sso` sandbox environment for easier S3 bucket creation and access control using SSO users 🟢
- 🎉 [v1.8.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.8.0) : Provides an environment for deploying FastAPI using AWS Lambda and API Gateway. 🟢
- 🎉 [v1.7.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.7.0) : Added `s05_api_lambda` sandbox environment for serverless APIs integrating API Gateway and Lambda functions 🟢
- 🎉 [v1.6.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.6.0) : Added a sandbox environment for deploying and managing simple Lambda functions. 🟢
- 🎉 [v1.5.0](https://github.com/Sunwood-ai-labs/AlphaExperiment/releases/tag/v1.11.1) : Added EC2 instance visualization functionality and automatic AWS architecture diagram generation using generative AI 🟢
- 🎉 [v1.4.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.4.0) : Added EC2 AWS Visual Sandbox 🟢
- 🎉 [v1.3.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.3.0) : Enhanced Streamlit app deployer security and improved documentation
- 🎉 [v1.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.2.0) : Added Terraform configuration for Streamlit app deployment
- 🎉 [v1.1.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.1) : Improved documentation and style changes
- 🎉 [v1.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.0) : Adjusted header image generation algorithm
- [v1.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.0.0) : Refine organization scripts

## 🤖 Generative AI Usage

This repository utilizes generative AI for creating Terraform scripts. The requirements definition document for using generative AI to design and implement infrastructure is located at [docs/REQUIREMENTS_DEFINITION.md](docs/REQUIREMENTS_DEFINITION.md). Refer to this document to learn how to effectively leverage generative AI for building AWS resources.

## 🤝 Contributions

1. Fork this repository.
2. Create a new branch (`git checkout -b feature/amazing-feature`).
3. Commit your changes (`git commit -m 'Add some amazing feature'`).
4. Push to the branch (`git push origin feature/amazing-feature`).
5. Create a pull request.

## 📄 License

This project is released under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgements

- [Terraform](https://www.terraform.io/)
- [AWS](https://aws.amazon.com/)
- [Streamlit](https://streamlit.io/)

---

Developer: [Sunwood-ai-labs](https://github.com/Sunwood-ai-labs)
</readme>
</readme>
```