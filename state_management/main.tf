provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "terraform-native-state-locking-youtube"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_security_group" "youtube" {
  name = "prod-sg"
}

resource "aws_iam_user" "dev" {
  name = "Prod-user"
}

resource "aws_iam_user" "prod" {
  name = "Dev-user"
}