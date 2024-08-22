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
>This repository's release notes, README, and commit messages are mostly generated using [claude.ai](https://claude.ai/), [ChatGPT4](https://chatgpt.com/), and [AIRA](https://github.com/Sunwood-ai-labs/AIRA), [SourceSage](https://github.com/Sunwood-ai-labs/SourceSage), [Gaiah](https://github.com/Sunwood-ai-labs/Gaiah), [HarmonAI_II](https://github.com/Sunwood-ai-labs/HarmonAI_II).

## 🌟 Getting Started

**aws-terraform-sandbox** is an experimental platform for automating and managing AWS cloud infrastructure with Terraform. This repository aims to create Terraform scripts using generative AI and learn by experimenting with the construction of cloud infrastructure.

It provides various Terraform templates and scripts for safely experimenting with real AWS environments. It also includes guidelines for designing and implementing infrastructure using generative AI.

## 🚀 How to Start

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

6. Enter `yes` when prompted for confirmation.

7. Once the deployment is complete, access the public IP address shown in the output to verify your Streamlit application.

8. When finished, make sure to run the following command to delete your resources:
   ```
   terraform destroy
   ```
   Enter `yes` when prompted for confirmation.

> [!WARNING]
> The `terraform destroy` command deletes all the AWS resources you created. Make sure there's no data you want to keep before running it.

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

2. **s02_streamlit_aws_deployer**: Sets up an AWS infrastructure that deploys a Streamlit application with more advanced configurations, including automatic start/stop schedules.

3. **s03_ec2_aws_visual**: Creates an EC2 instance and its associated resources (VPC, subnets, security groups, etc.) and provides tools for visualizing them.
    - 🎉 **EC2 instance and associated resources visualization feature**
    - 🎉 **Automatic generation of AWS configuration diagrams using generative AI**

4. **s04_simple_lambda**: Added a sandbox environment for deploying and managing simple Lambda functions.

5. **s05_api_lambda**: Added a deployment environment for serverless APIs that integrate API Gateway and Lambda functions.

6. **s06_fastapi_lambda**: Provides an environment for deploying FastAPI using AWS Lambda and API Gateway.
    - 🎉 **Added FastAPI serverless API sandbox environment** 🟢
    - 🎉 **Added functionality to call Lambda functions from local environment** 🟢
    - 🚀 **Introduced variables to Terraform scripts** 🟢
    - 🚀 **Added Python script for calling Lambda functions** 🟢
    - 🚀 **Changed to call Lambda functions using API Gateway URL** 🟢

7. **s07_simple_sso**: Added a sandbox environment for easier S3 bucket creation and access management by SSO users 🟢
    - You can customize the prefix and tags for S3 bucket names in `variables.tf`.
    - `terraform.tfvars.example` provides configuration examples.
    - `main.tf` creates the S3 bucket and applies tags.
    - `README.md` describes how to use and configure the environment.

For more details on each sandbox environment, refer to [sandbox/README.md](sandbox/README.md).

## 📝 Updates

- 🎉 [v1.9.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.9.1) : Added `s07_simple_sso` sandbox environment for easier S3 bucket creation and access management by SSO users 🟢
- 🎉 [v1.8.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.8.0) : Provides an environment for deploying FastAPI using AWS Lambda and API Gateway. 🟢
- 🎉 [v1.7.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.7.0) : Added `s05_api_lambda` sandbox environment for serverless APIs that integrate API Gateway and Lambda functions 🟢
- 🎉 [v1.6.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.6.0) : Added a sandbox environment for deploying and managing simple Lambda functions. 🟢
- 🎉 [v1.5.0](https://github.com/Sunwood-ai-labs/AlphaExperiment/releases/tag/v1.11.1) : Added EC2 instance and associated resources visualization feature, and automatic generation of AWS configuration diagrams using generative AI 🟢
- 🎉 [v1.4.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.4.0) : Added EC2 AWS Visual Sandbox 🟢
- 🎉 [v1.3.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.3.0) : Security enhancements and document improvements for the Streamlit app deployer
- 🎉 [v1.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.2.0) : Added Terraform configurations for deploying Streamlit apps
- 🎉 [v1.1.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.1) : Document improvements and style changes
- 🎉 [v1.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.0) : Adjustment of header image generation algorithms
- [v1.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.0.0) : Refinement of maintenance scripts

## 🤖 Using Generative AI

This repository uses generative AI to create Terraform scripts. You can find the requirements definition document for using generative AI to design and implement infrastructure in [docs/REQUIREMENTS_DEFINITION.md](docs/REQUIREMENTS_DEFINITION.md). By referring to this document, you can learn how to effectively use generative AI to build AWS resources.

## 🤝 Contribution

1. Fork this repository.
2. Create a new branch ( `git checkout -b feature/amazing-feature`).
3. Commit your changes ( `git commit -m 'Add some amazing feature'`).
4. Push to the branch ( `git push origin feature/amazing-feature`).
5. Create a pull request.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Terraform](https://www.terraform.io/)
- [AWS](https://aws.amazon.com/)
- [Streamlit](https://streamlit.io/)

---

Developer: [Sunwood-ai-labs](https://github.com/Sunwood-ai-labs)
</readme>
```