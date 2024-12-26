provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "sg-1" {
  name = "app-firewall"

  tags = local.default
}

resource "aws_security_group" "sg-2" {
  name = "dev-firewall"

  tags = local.default
}

variable "tags" {
  type = map 
  default = {
    Team = "security-team"
  }
}

locals {
  default = {
    Team = "security-team"
    CreationDate = "date-${formatdate("DD/MM/YYYY",timestamp())}"
  }
}