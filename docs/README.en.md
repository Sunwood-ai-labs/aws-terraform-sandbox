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
>This repository's release notes, README, and nearly 90% of commit messages are generated using [claude.ai](https://claude.ai/) and [ChatGPT4](https://chatgpt.com/) with the help of [AIRA](https://github.com/Sunwood-ai-labs/AIRA), [SourceSage](https://github.com/Sunwood-ai-labs/SourceSage), [Gaiah](https://github.com/Sunwood-ai-labs/Gaiah), and [HarmonAI_II](https://github.com/Sunwood-ai-labs/HarmonAI_II).

## 🌟 Getting Started

**aws-terraform-sandbox** is an experimental platform for automating and managing the infrastructure of AWS cloud environments using Terraform. This repository aims to learn by trial and error through the creation of Terraform scripts using generative AI and building cloud infrastructure.

This repository provides scripts that allow you to safely experiment with real AWS environments using various Terraform templates and scripts. It also includes guidelines for designing and implementing infrastructure using generative AI.

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

6. Enter `yes` when prompted to confirm.

7. Once the deployment is complete, access the public IP address outputted to view the Streamlit application.

8. When finished, always run the following commands to delete resources:
   ```
   terraform destroy
   ```
   Enter `yes` when prompted to confirm.

> [!WARNING]
> The `terraform destroy` command will delete all AWS resources created. Ensure that you do not have any data you wish to keep before executing.

## 📂 Project Structure

```
aws-terraform-sandbox/
├─ sandbox/
│  ├─ s01_streamlit_aws_setup/
│  ├─ s02_streamlit_aws_deployer/
│  ├─ README.md
├─ docs/
│  ├─ REQUIREMENTS_DEFINITION.md
├─ issue_creator.log
├─ README.md
```

## 🛠 Sandbox Environments

This repository includes the following sandbox environments:

1. **s01_streamlit_aws_setup**: Sets up AWS infrastructure to deploy a basic Streamlit application.

2. **s02_streamlit_aws_deployer**: Sets up AWS infrastructure to deploy a Streamlit application with more advanced settings, including automatic start/stop scheduling.

For more details on each sandbox environment, please refer to [sandbox/README.md](sandbox/README.md).

## 📝 Updates

- 🎉 [v1.2.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.2.0) : Added Terraform configuration for Streamlit app deployment.
- 🎉 [v1.1.1](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.1) : Improved documentation and style changes.
- 🎉 [v1.1.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.1.0) : Adjusted header image generation algorithm.
- [v1.0.0](https://github.com/Sunwood-ai-labs/aws-terraform-sandbox/releases/tag/v1.0.0) : Improved maintenance scripts.

## 🤖 Generative AI Usage

This repository uses generative AI to create Terraform scripts. The requirements definition document for using generative AI to design and implement infrastructure is available at [docs/REQUIREMENTS_DEFINITION.md](docs/REQUIREMENTS_DEFINITION.md). This document can help you learn how to effectively use generative AI to build AWS resources.

## 🤝 Contributions

1. Fork this repository.
2. Create a new branch (e.g., `git checkout -b feature/amazing-feature`).
3. Commit your changes (e.g., `git commit -m 'Add some amazing feature'`).
4. Push to the branch (e.g., `git push origin feature/amazing-feature`).
5. Create a pull request.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgements

- [Terraform](https://www.terraform.io/)
- [AWS](https://aws.amazon.com/)
- [Streamlit](https://streamlit.io/)

---

Developer: [Sunwood-ai-labs](https://github.com/Sunwood-ai-labs)

```