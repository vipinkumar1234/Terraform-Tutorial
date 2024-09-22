provider "aws" {
    region = "us-east-1"
  
}

variable "EC2_instance" {
    type = string
    default = "t2.micro"
  
}

resource "aws_instance" "Web" {
    ami = "ami-0fc5d935ebf8bc3bc"
    instance_type = var.EC2_instance
  
}