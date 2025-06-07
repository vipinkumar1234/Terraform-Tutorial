provider "aws" {
  region = "us-east-1"
}

variable "bucket_names" {
  type = list(string)
  default = [ 
    "prod-test-dev-bucket-youtube",
    "prod-test-qa-bucket-youtube",
    "prod-test-stage-bucket-youtube",
    "prod-test-prod-bucket-youtube"  
    ]
}

resource "aws_s3_bucket" "bucket" {
    for_each = toset(var.bucket_names)

    bucket = each.key

    tags = {
      Env = each.key
    }
}