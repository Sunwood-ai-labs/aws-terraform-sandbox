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
</p>

</h2>

</p>

>[!IMPORTANT]
> Nearly 90% of the release notes, README, and commit messages in this repository were generated using [claude.ai](https://claude.ai/), [ChatGPT4](https://chatgpt.com/), and [AIRA](https://github.com/Sunwood-ai-labs/AIRA), [SourceSage](https://github.com/Sunwood-ai-labs/SourceSage), [Gaiah](https://github.com/Sunwood-ai-labs/Gaiah), [HarmonAI_II](https://github.com/Sunwood-ai-labs/HarmonAI_II).

## 🌟 Getting Started

**aws-terraform-sandbox** is an experimental platform designed for automating and managing AWS cloud infrastructure using Terraform. This repository aims to leverage generative AI to create Terraform scripts and facilitate learning by experimenting with cloud infrastructure building.

The repository provides various Terraform templates and scripts that allow you to safely experiment with real AWS environments. It also includes guidelines for designing and implementing infrastructure using generative AI.

## 🚀 Getting Started

1. Clone the repository:
   ```
   git clone https://github.com/Sunwood-ai-labs/aws-terraform-sandbox.git
   cd aws-terraform-sandbox
   ```

2. Install and configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

3. Install [Terraform](https://developer.hashicorp.com/terraform/install).

4. Navigate to your desired sandbox environment:
   ```
   cd sandbox/s01_streamlit_aws_setup
   ```

5. Initialize and run Terraform:
   ```
   terraform init
   terraform apply
   ```

6. Enter `yes` when prompted to confirm.

7. Once deployment is complete, access the output public IP address to verify the Streamlit application.

8. Always remember to run the following command to delete resources after finishing your work:
   ```
   terraform destroy
   ```
   Enter `yes` when prompted to confirm.

> [!WARNING]
> The `terraform destroy` command will delete all created AWS resources. Make sure there's no data you want to keep before execution.

## 📂 Project Structure

```
aws-terraform-sandbox/
├─ sandbox/
│  ├─ s01_streamlit_aws_setup/
│  │  ├─ streamlit_aws_setup.tf
│  │  ├─ terraform.tfstate
│  ├─ s02_streamlit_aws_deployer/
│  │  ├─ variables.tf
│  │  ├─ main.tf
│  │  ├─ terraform.tfvars
│  │  ├─ terraform.tfstate
├─ docs/
│  ├─ REQUIREMENTS_DEFINITION.md
├─ issue_creator.log
├─ README.md
```

## 🛠 Sandbox Environments

### s01_streamlit_aws_setup

This sandbox creates the following AWS resources:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance (hosting the Streamlit application)
- Elastic IP

### s02_streamlit_aws_deployer

This sandbox creates the following AWS resources:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance (hosting the Streamlit application)
- Elastic IP
- CloudWatch Event Rule (for instance start/stop)
- IAM Role (for EC2 instance, CloudWatch events)
- IAM Policy (for EC2 instance)
- IAM Instance Profile
- Session Manager configuration

## 📝 Updates

- 🎉 [v1.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.2.0) : Added Terraform configuration for Streamlit app deployment
- 🎉 [v1.1.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.1) : Improved documentation and style changes
- 🎉 [v1.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.0) : Adjusted header image generation algorithm
- [v1.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.0.0) : Refined the organization of scripts

## 🤖 Generative AI Utilization

This repository utilizes generative AI to create Terraform scripts. The requirements definition document for using generative AI to design and implement infrastructure can be found in [docs/REQUIREMENTS_DEFINITION.md](docs/REQUIREMENTS_DEFINITION.md). By referring to this document, you can learn how to effectively leverage generative AI to build AWS resources.

## 🤝 Contributions

1. Fork this repository.
2. Create a new branch (e.g., `git checkout -b feature/amazing-feature`).
3. Commit your changes (e.g., `git commit -m 'Add some amazing feature'`).
4. Push to the branch (e.g., `git push origin feature/amazing-feature`).
5. Create a pull request.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Terraform](https://www.terraform.io/)
- [AWS](https://aws.amazon.com/)
- [Streamlit](https://streamlit.io/)

---

Developer: [Sunwood-ai-labs](https://github.com/Sunwood-ai-labs)