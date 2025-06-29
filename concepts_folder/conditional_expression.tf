provider "aws" {}

variable "environment" {
    default = "dev"  
}

variable "region" {
    default = "us-east-1"
  
}

resource "aws_instance" "web" {
    ami = "nshgahhgjqwjq"
    instance_type = var.environment == "production" && var.region == "us-east-1" ? "t2.large" : "t2.medium" 
}