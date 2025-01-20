provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "Test" {
  for_each = toset( ["user-01", "user-02", "user-03", "user-04"])
  name = each.key
}

variable "instances" {
  default = {
    "intsance-01" = { name = "web-01", ebs_volume = 20}
    "intsance-02" = { name = "web-02", ebs_volume = 30}
    "intsance-03" = { name = "web-03", ebs_volume = 40}
  }
}

resource "aws_instance" "Prod" {
  for_each = var.instances
  ami = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"

  tags = {
    Name = each.value.name
  }
  root_block_device {
    volume_size = each.value.ebs_volume
  }
}