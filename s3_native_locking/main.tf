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

resource "time_sleep" "wait_30_seconds" {

  create_duration = "300s"
}