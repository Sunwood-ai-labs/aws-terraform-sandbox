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
>Nearly 90% of the release notes, README, and commit messages in this repository are generated using [claude.ai](https://claude.ai/), [ChatGPT4](https://chatgpt.com/), and [AIRA](https://github.com/Sunwood-ai-labs/AIRA), [SourceSage](https://github.com/Sunwood-ai-labs/SourceSage), [Gaiah](https://github.com/Sunwood-ai-labs/Gaiah), [HarmonAI_II](https://github.com/Sunwood-ai-labs/HarmonAI_II).

## 🌟 Introduction

**aws-terraform-sandbox** is an experimental platform for automating and managing the infrastructure of AWS cloud environments with Terraform. This repository aims to create Terraform scripts using generative AI, learn by trial and error, and build cloud infrastructure.

We provide scripts that allow you to safely experiment with real AWS environments using various Terraform templates and scripts. It also includes guidelines for designing and implementing infrastructure using generative AI.

## 🚀 Getting Started

1. Clone the repository:
   ```
   git clone https://github.com/Sunwood-ai-labs/aws-terraform-sandbox.git
   cd aws-terraform-sandbox
   ```

2. Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and configure your credentials.

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

7. Once deployment is complete, access the public IP address displayed and verify the Streamlit application.

8. When you are finished working, be sure to run the following command to delete the resources:
   ```
   terraform destroy
   ```
   Type `yes` when prompted for confirmation.

> [!WARNING]
> The `terraform destroy` command will delete all AWS resources created. Before running, make sure you have no data to keep.

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

1. **s01_streamlit_aws_setup**: Sets up an AWS infrastructure to deploy a basic Streamlit application.

2. **s02_streamlit_aws_deployer**: Deploys Streamlit applications with more advanced configurations and sets up an AWS infrastructure that includes automatic start/stop schedules.

3. **s03_ec2_aws_visual**: Creates an EC2 instance and its related resources (VPC, subnet, security group, etc.), and provides tools for visualizing them.
    - 🎉 **EC2 instance and related resource visualization functionality**
    - 🎉 **Automatic generation of AWS diagrams using generative AI**

4. **s04_simple_lambda**: Added a sandbox environment for deploying and managing simple Lambda functions.

5. **s05_api_lambda**: Added a deployment environment for serverless APIs integrating API Gateway and Lambda functions.

6. **s06_fastapi_lambda**: Provides an environment for deploying FastAPI using AWS Lambda and API Gateway.
    - 🎉 **Added FastAPI serverless API sandbox environment** 🟢
    - 🎉 **Added functionality to call Lambda functions from local** 🟢
    - 🚀 **Introduced variables into Terraform script** 🟢
    - 🚀 **Added Python script for calling Lambda functions** 🟢
    - 🚀 **Changed to call Lambda functions using the API Gateway URL** 🟢

7. **s07_simple_sso**: Added a sandbox environment to make creating and managing S3 buckets by SSO users easier 🟢
    - You can customize the prefix and tags of the S3 bucket name in `variables.tf`.
    - `terraform.tfvars.example` provides an example configuration.
    - `main.tf` creates the S3 bucket and applies tags.
    - `README.md` describes how to use and configure the environment.

8. **s08_ec2_docker**: Added a sandbox environment for building Docker environments on AWS EC2 instances.
    - 🎉 **Added `s08_ec2_docker` sandbox environment** 🟢
    - Provides Terraform configuration for automatically installing Docker and Docker Compose on EC2 instances.
    - Provides a secure network configuration using a private subnet and a NAT Gateway.
    - Provides secure access to EC2 instances with Systems Manager.
    - Describes the environment setup and usage in detail in `README.md`.
    - You can customize environment settings in `terraform.tfvars`.

9. **s09-ec2-docker-moa**: Added a sandbox environment for deploying Docker environments and MOA projects on AWS EC2 instances.
    - 🎉 **Added `s09-ec2-docker-moa` sandbox environment** 🟢
    - Automatically sets up MOA projects by automatically installing Docker and Docker Compose on EC2 instances.
    - Describes the environment setup and usage in detail in `README.md`.
    - You can customize environment settings in `terraform.tfvars`.

10. **s10-docker-ec2-scheduler-moa**: Added a sandbox environment for deploying MOA projects on AWS EC2 instances and setting scheduled start and stop times.
    - 🎉 **Added `s10-docker-ec2-scheduler-moa` sandbox environment** 🟢
    - Automatically deploys EC2 instances with Docker and MOA pre-installed.
    - Implements a scheduler to automatically start and stop EC2 instances.
    - Makes it easy to try AWS Bedrock and Cloud AI services.
    - Describes the environment setup and usage in detail in `README.md`.
    - You can customize environment settings in `terraform.tfvars`.

11. **s11_streamlit-fargate**: Provides an environment for deploying Streamlit applications on AWS Fargate.
    - 🎉 **Added `s11_streamlit-fargate` sandbox environment** 🟢
    - Containerizes Streamlit applications using Docker.
    - Deploys containers on AWS Fargate to build a scalable environment.
    - Distributes traffic using the Application Load Balancer.
    - Provides secure network settings using VPC and security groups.
    - Automatically sets up ECS clusters and task definitions.

12. **s13_streamlit-fargate-ial**: Provides an environment for deploying Streamlit applications on AWS Fargate.
    - 🎉 **Added `s13_streamlit-fargate-ial` sandbox environment** 🟢
    - Containerizes Streamlit applications using Docker.
    - Deploys containers on AWS Fargate to build a scalable environment.
    - Distributes traffic using the Application Load Balancer.
    - Provides secure network settings using VPC and security groups.
    - Automatically sets up ECS clusters and task definitions.
    - Creates a Nyan Cafe dashboard application, provides an example of creating with Streamlit and deploying using AWS Fargate and ECS.

13. **s14_streamlit-fargate-ial-modular**: Added a sandbox environment for deploying Streamlit applications on AWS Fargate and managing infrastructure using modularized Terraform code.
    - 🎉 **Added `s14_streamlit-fargate-ial-modular` sandbox environment** 🟢
    - Uses modules to separate and manage infrastructure components such as network, security, ALB, and ECS.
    - Introduces IP whitelist functionality, restricting access to the ALB.
    - Simplifies the construction of continuous integration and continuous delivery (CI/CD) pipelines.

14. **s15_streamlit-fargate-whitelist**: Provides an environment for deploying Streamlit applications on AWS Fargate with added IP whitelist functionality.
    - 🎉 **Added `s15_streamlit-fargate-whitelist` sandbox environment** 🟢
    - Containerizes Streamlit applications using Docker.
    - Deploys containers on AWS Fargate to build a scalable environment.
    - Distributes traffic using the Application Load Balancer.
    - Provides secure network settings using VPC and security groups.
    - Automatically sets up ECS clusters and task definitions.
    - Introduces IP whitelist functionality, restricting access to the ALB.
    - You can update Fargate images using PowerShell scripts.

For details on each sandbox environment, see [sandbox/README.md](sandbox/README.md).

## 📝 Updates

- 🎉 [v2.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.2.0) : Added `s15_streamlit-fargate-whitelist` sandbox environment and updated documentation 🟢
- 🎉 [v2.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.1.0) : Improved `s13_streamlit-fargate-ial` sandbox environment and updated documentation 🟢
- 🎉 [v2.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v2.0.0) : Added MOA project deployment functionality, Gemini-1.5-flash model, implemented EC2 scheduler, etc. 🟢
- 🎉 [v1.10.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.10.0) : Added `s08_ec2_docker` sandbox environment for building Docker environments on AWS EC2 instances 🟢
- 🎉 [v1.9.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.9.1) : Added `s07_simple_sso` sandbox environment to make creating and managing S3 buckets by SSO users easier 🟢
- 🎉 [v1.8.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.8.0) : Provides an environment for deploying FastAPI using AWS Lambda and API Gateway. 🟢
- 🎉 [v1.7.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.7.0) : Added `s05_api_lambda` sandbox environment, a deployment environment for serverless APIs integrating API Gateway and Lambda functions 🟢
- 🎉 [v1.6.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.6.0) : Added a sandbox environment for deploying and managing simple Lambda functions. 🟢
- 🎉 [v1.5.0](https://github.com/Sunwood-ai-labs/AlphaExperiment/releases/tag/v1.11.1) : Added EC2 instance and related resource visualization functionality, automatic generation of AWS diagrams using generative AI 🟢
- 🎉 [v1.4.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.4.0) : Added EC2 AWS Visual Sandbox 🟢
- 🎉 [v1.3.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.3.0) : Enhanced security of Streamlit app deployer and improved documentation
- 🎉 [v1.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.2.0) : Added Terraform configurations for Streamlit app deployment
- 🎉 [v1.1.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.1) : Improved documentation and style changes
- 🎉 [v1.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.0) : Adjusted header image generation algorithm
- [v1.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.0.0) : Refined maintenance scripts

## 🤖 Generative AI Usage

This repository utilizes generative AI to create Terraform scripts. The requirements definition document for using generative AI to design and implement infrastructure is available at [docs/REQUIREMENTS_DEFINITION.md](docs/REQUIREMENTS_DEFINITION.md). By referring to this document, you can learn how to effectively use generative AI to build AWS resources.

## 🤝 Contributions

1. Fork this repository.
2. Create a new branch ( `git checkout -b feature/amazing-feature`).
3. Commit your changes ( `git commit -m 'Add some amazing feature'`).
4. Push to the branch ( `git push origin feature/amazing-feature`).
5. Create a pull request.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgements

- [Terraform](https://www.terraform.io/)
- [AWS](https://aws.amazon.com/)
- [Streamlit](https://streamlit.io/)

---

Developer: [Sunwood-ai-labs](https://github.com/Sunwood-ai-labs)
</readme>
```