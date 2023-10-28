Terraform is an infrastructure as code tool that lets you build, change, and version cloud and on-prem resources safely and efficiently.


# Terraform-Tutorial

**Install Terraform on Ubuntu:**

Open a terminal

Update your system's package list:

sudo apt update

sudo apt install unzip

wget https://releases.hashicorp.com/terraform/X.Y.Z/terraform_X.Y.Z_linux_amd64.zip Note(Replace X.Y.Z with  the version you want to install.)

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

Unzip the downloaded file and move the terraform binary to a directory in your PATH, like /usr/local/bin:

unzip terraform_X.Y.Z_linux_amd64.zip
sudo mv terraform /usr/local/bin/

Verify the installation by running: terraform --version


**Install AWS CLI on Ubuntu:**

sudo apt update

curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install

aws --version

**Configure AWS CLI on Ubuntu:**

aws configure 

**########## installing terraform on Windows ##########**

Install Terraform on Windows:

Download the latest Terraform binary for Windows from the official website here.

https://developer.hashicorp.com/terraform/downloads

https://releases.hashicorp.com/terraform/1.6.2/terraform_1.6.2_windows_386.zip

Extract the downloaded ZIP file.

Move the terraform.exe executable to a directory that's in your system's PATH, like C:\Windows\System32

Open a Command Prompt or PowerShell and verify the installation:

terraform --version

**Install AWS CLI on Windows:**

Download the AWS CLI installer for Windows from the official website here.

https://awscli.amazonaws.com/AWSCLIV2.msi

https://aws.amazon.com/cli/

Run the installer and follow the installation instructions. This will install AWS CLI on your Windows system.

Verify the installation by opening Command Prompt or PowerShell and running:

**Configure AWS CLI on Windows:**

Run the following command and follow the prompts to configure AWS CLI with your access and secret access keys, default region, and output format:

aws configure

