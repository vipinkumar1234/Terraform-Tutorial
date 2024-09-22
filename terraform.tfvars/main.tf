provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "Web" {
    ami = "jhhdgqhggwhq62662"
    instance_type = var.instance_type
  
}