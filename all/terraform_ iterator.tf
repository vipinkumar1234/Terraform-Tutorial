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
    for_each = var.sg_port  # Loops through each value in the 'sg_port' variable
    iterator = port         # Assigns the name 'port' to the current item in the loop for clarity

    content {
      from_port   = port.value   # Accesses the current port number for 'from_port'
      to_port     = port.value   # Accesses the current port number for 'to_port'
      protocol    = "tcp"        
      cidr_blocks = ["0.0.0.0/0"] 
    }
  }
}