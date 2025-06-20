provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
}

variable "region" {
  type = string
  default = "us-east-1"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "ami" {
  type = string
  default = "ami-020cba7c55df1f615"
}