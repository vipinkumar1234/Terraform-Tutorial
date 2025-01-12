provider "aws" {
  region = "us-east-1"
}

variable "allowed_ports" {
  type = list(number)
  default = [ 8080, 8081, 22, 443, 5050, ]
}

resource "aws_security_group" "Test-sg" {
  name = "Youtube-test-sg"

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    } 
  }
} 