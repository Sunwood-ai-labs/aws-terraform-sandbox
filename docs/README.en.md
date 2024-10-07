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
>Nearly 90% of this repository's release notes, README, and commit messages were generated using [claude.ai](https://claude.ai/) and [ChatGPT4](https://chatgpt.com/) through [AIRA](https://github.com/Sunwood-ai-labs/AIRA), [SourceSage](https://github.com/Sunwood-ai-labs/SourceSage), [Gaiah](https://github.com/Sunwood-ai-labs/Gaiah), and [HarmonAI_II](https://github.com/Sunwood-ai-labs/HarmonAI_II).

## 🌟 Getting Started

**aws-terraform-sandbox** is an experimental platform designed to automate and manage AWS cloud infrastructure using Terraform. This repository aims to leverage generative AI for creating Terraform scripts and learning through trial and error in building cloud infrastructure.

It provides various Terraform templates and scripts for safe experimentation in real AWS environments. It also includes guidelines for designing and implementing infrastructure using generative AI.

## 🚀 How to Start

1. Clone the repository:
   ```
   git clone https://github.com/Sunwood-ai-labs/aws-terraform-sandbox.git
   cd aws-terraform-sandbox
   ```

2. Install [AWS CLI](https://docs.aws.amazon.com/en_us/cli/latest/userguide/getting-started-install.html) and configure your credentials.

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

6. Enter `yes` at the prompt to confirm.

7. Once deployment is complete, access the output public IP address to verify the Streamlit application.

8. After finishing your work, be sure to run the following command to delete resources:
   ```
   terraform destroy
   ```
   Enter `yes` at the confirmation prompt.

> [!WARNING]
> The `terraform destroy` command will delete all created AWS resources. Before executing, ensure there is no data you want to retain.

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

This repository includes the following sandbox environments:

1. **s01_streamlit_aws_setup**: Sets up AWS infrastructure to deploy a basic Streamlit application.

2. **s02_streamlit_aws_deployer**: Deploys a Streamlit application with more advanced settings, including automated startup/shutdown schedules.

3. **s03_ec2_aws_visual**: Creates EC2 instances and related resources (VPC, subnets, security groups, etc.) and provides tools for visual representation.
    - 🎉 **EC2 Instance and Related Resource Visualization Functionality**
    - 🎉 **Automatic AWS Diagram Generation using Generative AI**

4. **s04_simple_lambda**: Adds a sandbox environment for deploying and managing simple Lambda functions.

5. **s05_api_lambda**: Adds a deployment environment for serverless APIs integrating API Gateway and Lambda functions.

6. **s06_fastapi_lambda**: Provides an environment for deploying FastAPI using AWS Lambda and API Gateway.
    - 🎉 **Added FastAPI serverless API sandbox environment** 🟢
    - 🎉 **Added functionality for invoking Lambda functions locally** 🟢
    - 🚀 **Introduced variables into Terraform scripts** 🟢
    - 🚀 **Added Python scripts for invoking Lambda functions** 🟢
    - 🚀 **Changed to use API Gateway URL for invoking Lambda functions** 🟢

7. **s07_simple_sso**: Added a sandbox environment to facilitate SSO user creation of S3 buckets and access control. 🟢
    - `variables.tf` allows customization of S3 bucket name prefixes and tags.
    - `terraform.tfvars.example` provides configuration examples.
    - `main.tf` creates S3 buckets and applies tags.
    - `README.md` provides instructions on environment usage and configuration.

8. **s08_ec2_docker**: Added a sandbox environment for building a Docker environment on an AWS EC2 instance.
    - 🎉 **Added `s08_ec2_docker` sandbox environment** 🟢
    - Provides Terraform configuration to automatically install Docker and Docker Compose on EC2 instances.
    - Provides a secure network configuration with private subnets and NAT Gateway.
    - Provides secure access to the EC2 instance using Systems Manager.
    - Details on environment setup and usage are described in `README.md`.
    - `terraform.tfvars` allows customization of environment settings.

9. **s09-ec2-docker-moa**: Added a sandbox environment for deploying a Docker environment and the MOA project on an AWS EC2 instance.
    - 🎉 **Added `s09-ec2-docker-moa` sandbox environment** 🟢
    - Automatically installs Docker and Docker Compose on the EC2 instance to set up the MOA project.
    - Details on environment setup and usage are described in `README.md`.
    - `terraform.tfvars` allows customization of environment settings.

10. **s10-docker-ec2-scheduler-moa**: Added a sandbox environment for deploying the MOA project on an AWS EC2 instance and setting scheduled start and stop times.
    - 🎉 **Added `s10-docker-ec2-scheduler-moa` sandbox environment** 🟢
    - Automatically deploys EC2 instances with pre-installed Docker and MOA.
    - Implements a scheduler for automatically starting and stopping EC2 instances.
    - Makes it easy to try AWS Bedrock and Cloud AI services.
    - Details on environment setup and usage are described in `README.md`.
    - `terraform.tfvars` allows customization of environment settings.

11. **s11_streamlit-fargate**: Provides an environment for deploying Streamlit applications on AWS Fargate.
    - 🎉 **Added `s11_streamlit-fargate` sandbox environment** 🟢
    - Containerize Streamlit applications using Docker.
    - Deploy containers on AWS Fargate to build a scalable environment.
    - Distribute traffic using Application Load Balancer.
    - Provide secure network configuration using VPC and security groups.
    - Automatically set up ECS clusters and task definitions.

12. **s13_streamlit-fargate-ial**: Provides an environment for deploying Streamlit applications on AWS Fargate.
    - 🎉 **Added `s13_streamlit-fargate-ial` sandbox environment** 🟢
    - Containerize Streamlit applications using Docker.
    - Deploy containers on AWS Fargate to build a scalable environment.
    - Distribute traffic using Application Load Balancer.
    - Provide secure network configuration using VPC and security groups.
    - Automatically set up ECS clusters and task definitions.
    - Creates a Neko Cafe Dashboard application as an example of creating an application with Streamlit and deploying it using AWS Fargate and ECS.

For details on each sandbox environment, please refer to [sandbox/README.md](sandbox/README.md).

## 📝 Updates

- 🎉 [v2.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.1.0): Improved `s13_streamlit-fargate-ial` sandbox environment and updated documentation 🟢
- 🎉 [v2.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.0.0): Added MOA project deployment functionality, Gemini-1.5-flash model, EC2 scheduler implementation, etc. 🟢
- 🎉 [v1.10.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.10.0): Added `s08_ec2_docker` sandbox environment for building a Docker environment on an AWS EC2 instance. 🟢
- 🎉 [v1.9.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.9.1): Added `s07_simple_sso` sandbox environment to facilitate SSO user creation of S3 buckets and access control. 🟢
- 🎉 [v1.8.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.8.0): Provides an environment for deploying FastAPI using AWS Lambda and API Gateway. 🟢
- 🎉 [v1.7.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.7.0): Added `s05_api_lambda` sandbox environment for serverless APIs integrating API Gateway and Lambda functions. 🟢
- 🎉 [v1.6.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.6.0): Added a sandbox environment for deploying and managing simple Lambda functions. 🟢
- 🎉 [v1.5.0](https://github.com/Sunwood-ai-labs/AlphaExperiment/releases/tag/v1.11.1): Added EC2 instance and related resource visualization functionality, and automatic AWS diagram generation using generative AI. 🟢
- 🎉 [v1.4.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.4.0): Added EC2 AWS Visual Sandbox. 🟢
- 🎉 [v1.3.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.3.0): Enhanced Streamlit app deployer security and improved documentation.
- 🎉 [v1.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.2.0): Added Terraform configuration for Streamlit app deployment.
- 🎉 [v1.1.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.1): Improved documentation and style changes.
- 🎉 [v1.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.0): Adjusted header image generation algorithm.
- [v1.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.0.0): Organized maintenance scripts.

## 🤖 Generative AI Utilization

This repository utilizes generative AI to create Terraform scripts. The requirements definition document for using generative AI to design and implement infrastructure is available at [docs/REQUIREMENTS_DEFINITION.md](docs/REQUIREMENTS_DEFINITION.md). Refer to this document to learn how to effectively leverage generative AI to build AWS resources.

## 🤝 Contribution

1. Fork this repository.
2. Create a new branch ( `git checkout -b feature/amazing-feature` ).
3. Commit your changes ( `git commit -m 'Add some amazing feature'` ).
4. Push to the branch ( `git push origin feature/amazing-feature` ).
5. Create a pull request.

## 📄 License

This project is licensed under the MIT License. For more information, please refer to the [LICENSE](LICENSE) file.

## 🙏 Acknowledgments

- [Terraform](https://www.terraform.io/)
- [AWS](https://aws.amazon.com/)
- [Streamlit](https://streamlit.io/)

---

Developer: [Sunwood-ai-labs](https://github.com/Sunwood-ai-labs)
</readme>
```