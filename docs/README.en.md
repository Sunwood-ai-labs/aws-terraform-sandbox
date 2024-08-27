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
> Nearly 90% of this repository's release notes, README, and commit messages are generated using [claude.ai](https://claude.ai/), [ChatGPT4](https://chatgpt.com/), and AI tools like [AIRA](https://github.com/Sunwood-ai-labs/AIRA), [SourceSage](https://github.com/Sunwood-ai-labs/SourceSage), [Gaiah](https://github.com/Sunwood-ai-labs/Gaiah), and [HarmonAI_II](https://github.com/Sunwood-ai-labs/HarmonAI_II).

## 🌟 Introduction

**aws-terraform-sandbox** is an experimental platform for automating and managing AWS cloud infrastructure using Terraform. This repository aims to provide a safe environment for learning and experimenting with building cloud infrastructure using Terraform by leveraging generative AI to create Terraform scripts.

This repository provides various Terraform templates and scripts for safe experimentation in real AWS environments. It also includes guidelines for designing and implementing infrastructure using generative AI.

## 🚀 Getting Started

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

6. Type `yes` to confirm when prompted.

7. Once deployment is complete, access the outputted public IP address to verify the Streamlit application.

8. After finishing your work, be sure to execute the following commands to delete resources:
   ```
   terraform destroy
   ```
   Type `yes` to confirm when prompted.

> [!WARNING]
> The `terraform destroy` command will delete all created AWS resources. Make sure there is no data you want to keep before execution.

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

2. **s02_streamlit_aws_deployer**: Sets up AWS infrastructure to deploy a more advanced Streamlit application, including automated startup and shutdown schedules.

3. **s03_ec2_aws_visual**: Creates an EC2 instance and its associated resources (VPC, subnets, security groups, etc.) and provides tools for visual representation.
    - 🎉 **EC2 Instance and Associated Resource Visualization Feature**
    - 🎉 **Automatic AWS Architecture Diagram Generation using Generative AI**

4. **s04_simple_lambda**:  Added a sandbox environment for deploying and managing simple Lambda functions.

5. **s05_api_lambda**:  Added a deployment environment for a serverless API that integrates API Gateway and Lambda functions.

6. **s06_fastapi_lambda**:  Provides an environment for deploying FastAPI using AWS Lambda and API Gateway.
    - 🎉 **Added FastAPI serverless API sandbox environment** 🟢
    - 🎉 **Added Lambda function calling capability from local environment** 🟢
    - 🚀 **Introduced variables into Terraform scripts** 🟢
    - 🚀 **Added Python script for calling Lambda functions** 🟢
    - 🚀 **Changed to call Lambda functions using API Gateway URLs** 🟢

7. **s07_simple_sso**:  Added a sandbox environment for easier S3 bucket creation and access management by SSO users 🟢
    - Customize S3 bucket name prefix and tags in `variables.tf`.
    - Example configuration available in `terraform.tfvars.example`.
    - `main.tf` creates the S3 bucket and applies tags.
    - `README.md` provides instructions on using and configuring the environment.

8. **s08_ec2_docker**: Added a sandbox environment for building a Docker environment on AWS EC2 instances.
    - 🎉 **Added `s08_ec2_docker` sandbox environment** 🟢
    - Provides Terraform configuration for automatically installing Docker and Docker Compose on EC2 instances.
    - Offers secure network configuration using private subnets and NAT Gateway.
    - Provides secure access to EC2 instances through Systems Manager.
    - `README.md` contains detailed information on environment setup and usage.
    - Customize environment settings in `terraform.tfvars`.

For more details on each sandbox environment, refer to [sandbox/README.md](sandbox/README.md).

## 📝 Updates

- 🎉 [v1.10.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.10.0) : Added `s08_ec2_docker` sandbox environment for building a Docker environment on AWS EC2 instances 🟢
- 🎉 [v1.9.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.9.1) : Added `s07_simple_sso` sandbox environment for easier S3 bucket creation and access management by SSO users 🟢
- 🎉 [v1.8.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.8.0) : Provides an environment for deploying FastAPI using AWS Lambda and API Gateway. 🟢
- 🎉 [v1.7.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.7.0) : Added `s05_api_lambda` sandbox environment for a serverless API that integrates API Gateway and Lambda functions 🟢
- 🎉 [v1.6.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.6.0) : Added a sandbox environment for deploying and managing simple Lambda functions. 🟢
- 🎉 [v1.5.0](https://github.com/Sunwood-ai-labs/AlphaExperiment/releases/tag/v1.11.1) : Added EC2 instance and associated resource visualization feature, and automatic AWS architecture diagram generation using generative AI 🟢
- 🎉 [v1.4.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.4.0) : Added EC2 AWS Visual Sandbox 🟢
- 🎉 [v1.3.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.3.0) : Improved security and documentation for Streamlit app deployer
- 🎉 [v1.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.2.0) : Added Terraform configuration for deploying Streamlit apps
- 🎉 [v1.1.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.1) : Documentation improvements and style changes
- 🎉 [v1.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.0) : Adjusted header image generation algorithm
- [v1.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.0.0) : Maintenance of organization scripts

## 🤖 Generative AI Usage

This repository uses generative AI to create Terraform scripts. The requirements definition document for using generative AI to design and implement infrastructure can be found in [docs/REQUIREMENTS_DEFINITION.md](docs/REQUIREMENTS_DEFINITION.md). By referring to this document, you can learn how to effectively leverage generative AI to build AWS resources.

## 🤝 Contributions

1. Fork this repository.
2. Create a new branch (`git checkout -b feature/amazing-feature`).
3. Commit your changes (`git commit -m 'Add some amazing feature'`).
4. Push to the branch (`git push origin feature/amazing-feature`).
5. Create a pull request.

## 📄 License

This project is licensed under the MIT License. For details, see the [LICENSE](LICENSE) file.

## 🙏 Acknowledgements

- [Terraform](https://www.terraform.io/)
- [AWS](https://aws.amazon.com/)
- [Streamlit](https://streamlit.io/)

---

Developer: [Sunwood-ai-labs](https://github.com/Sunwood-ai-labs)
</readme>
```