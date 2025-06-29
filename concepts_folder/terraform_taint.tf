provider "aws" {
    region = "us-east-1"
  
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "vipin-s3-demo-world-of-aws123" 
}


###    terraform taint aws_s3_bucket.s3_bucket  ####   this command to mark your resource as taint

