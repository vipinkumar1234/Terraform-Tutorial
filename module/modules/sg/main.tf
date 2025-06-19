provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "youtube" {
  name = "allow_tls"
}