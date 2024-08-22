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
>This repository's release notes, README, and commit messages are primarily generated using [claude.ai](https://claude.ai/) and [ChatGPT4](https://chatgpt.com/) through our tools, [AIRA](https://github.com/Sunwood-ai-labs/AIRA), [SourceSage](https://github.com/Sunwood-ai-labs/SourceSage), [Gaiah](https://github.com/Sunwood-ai-labs/Gaiah), and [HarmonAI_II](https://github.com/Sunwood-ai-labs/HarmonAI_II).

## 🌟 Getting Started

**aws-terraform-sandbox** is an experimental platform designed for automating and managing cloud infrastructure using Terraform within the AWS cloud environment. This repository aims to leverage generative AI to create Terraform scripts and learn through experimentation in building cloud infrastructure. 

It offers various Terraform templates and scripts, enabling you to safely experiment with real AWS environments. Additionally, guidelines are included for utilizing generative AI to design and implement cloud infrastructure.

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/Sunwood-ai-labs/aws-terraform-sandbox.git
   cd aws-terraform-sandbox
   ```

2. Install the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and configure your credentials.

3. Install [Terraform](https://developer.hashicorp.com/terraform/install).

4. Navigate to the desired sandbox environment:
   ```bash
   cd sandbox/s01_streamlit_aws_setup
   ```

5. Initialize and run Terraform:
   ```bash
   terraform init
   terraform apply
   ```

6. When prompted, enter `yes` to confirm.

7. After deployment, access the provided public IP address to check the Streamlit application.

8. When finished, be sure to destroy the resources using:
   ```bash
   terraform destroy
   ```
   Enter `yes` when prompted for confirmation.

> [!WARNING]
> The `terraform destroy` command will delete all AWS resources you created. Ensure that there is no data you wish to retain before executing it.

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
│  ├─ README.md
├─ docs/
│  ├─ REQUIREMENTS_DEFINITION.md
├─ issue_creator.log
├─ README.md
├─ pyproject.toml
```

## 🛠 Sandbox Environments

This repository includes the following sandbox environments:

1. **s01_streamlit_aws_setup**: Sets up an AWS infrastructure for deploying a basic Streamlit application.

2. **s02_streamlit_aws_deployer**: Deploys a Streamlit application with more advanced settings, including automated start/stop scheduling within the AWS infrastructure.

3. **s03_ec2_aws_visual**: Creates an EC2 instance with its associated resources (VPC, subnets, security groups, etc.) and provides tools for visualizing them.
    - 🎉 **EC2 instance and related resources visualization features**
    - 🎉 **Automatic AWS diagram generation using generative AI**

4. **s04_simple_lambda**: A sandbox environment added for deploying and managing simple Lambda functions.

5. **s05_api_lambda**: Added a deployment environment for serverless APIs integrating API Gateway and Lambda functions.

6. **s06_fastapi_lambda**: Provides an environment for deploying FastAPI using AWS Lambda and API Gateway.
    - 🎉 **Added a FastAPI serverless API sandbox environment** 🟢
    - 🎉 **Added the ability to invoke Lambda functions locally** 🟢
    - 🚀 **Introduced variables into Terraform scripts** 🟢
    - 🚀 **Added a Python script for invoking Lambda functions** 🟢
    - 🚀 **Changed to invoke Lambda functions using the API Gateway URL** 🟢

For more details on each sandbox environment, refer to [sandbox/README.md](sandbox/README.md).

## 📝 Update Information

- 🎉 [v1.8.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.8.0) : Provides an environment for deploying FastAPI using AWS Lambda and API Gateway. 🟢
- 🎉 [v1.7.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.7.0) : Added the `s05_api_lambda` sandbox environment, which is a deployment environment for serverless APIs integrating API Gateway and Lambda functions 🟢
- 🎉 [v1.6.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.6.0) : Added a sandbox environment for deploying and managing simple Lambda functions. 🟢
- 🎉 [v1.5.0](https://github.com/Sunwood-ai-labs/AlphaExperiment/releases/tag/v1.11.1) : Added EC2 instance and related resources visualization features, as well as automatic AWS diagram generation using generative AI 🟢
- 🎉 [v1.4.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.4.0) : Added EC2 AWS Visual Sandbox 🟢
- 🎉 [v1.3.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.3.0) : Enhanced security for the Streamlit app deployer and improved documentation
- 🎉 [v1.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.2.0) : Added Terraform configuration for Streamlit app deployment
- 🎉 [v1.1.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.1) : Improved documentation and style changes
- 🎉 [v1.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.0) : Adjusted the header image generation algorithm
- [v1.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.0.0) : Organized the cleanup scripts

## 🤖 Generative AI Usage

This repository leverages generative AI to create Terraform scripts. The requirements definition document for using generative AI to design and implement infrastructure is located at [docs/REQUIREMENTS_DEFINITION.md](docs/REQUIREMENTS_DEFINITION.md). By referring to this document, you can learn how to effectively utilize generative AI for building AWS resources.

## 🤝 Contributions

1. Fork this repository.
2. Create a new branch (e.g., `git checkout -b feature/amazing-feature`).
3. Commit your changes (e.g., `git commit -m 'Add some amazing feature'`).
4. Push to the branch (e.g., `git push origin feature/amazing-feature`).
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
```