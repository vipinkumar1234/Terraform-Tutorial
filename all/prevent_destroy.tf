provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami = "ami-05576a079321f21f8"
  instance_type = "t2.micro"

  lifecycle {
    prevent_destroy = false
  }
}