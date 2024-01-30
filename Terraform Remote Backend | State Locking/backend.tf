terraform {
  backend "s3" {
    bucket         = "vipin-s3-demo-world-of-aws" 
    key            = "abhi/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}