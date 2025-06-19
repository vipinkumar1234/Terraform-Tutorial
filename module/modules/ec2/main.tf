provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami = "ami-020cba7c55df1f615"
  instance_type = "t2.nano"
}