provider "aws" {
  region = "us-east-1"
}

variable "sg_port" {
  type = list(number)
  description = "Allowed Ports in dynamic sg "
  default = [ 8080, 8081, 8082, 8083, 8084]
}  
resource "aws_security_group" "dynamicsg-1" {
  name = "dynamic-sg"
  
  dynamic "ingress" {
    for_each = var.sg_port
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}