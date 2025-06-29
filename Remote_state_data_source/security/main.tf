provider "aws" {
  region = "us-east-1"
}

### First comment this block then run terraform init #######
terraform {
  backend "s3" {
    bucket = "terraform-native-state-locking-youtube"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "terraform-native-state-locking-youtube"
}


resource "aws_eip" "lb" {
  domain = "vpc"
}

output "eip_addr" {
  value = aws_eip.lb.public_ip
}