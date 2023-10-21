variable "instance_type" {
    type =  string
    default = t2.micro
    description = "This is my ec2 instance type"
  
}


##### Creating EC2 Using variable ################


resource "aws_instance" ".MyInstance" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = var.instance_type

  tags = {
    Name = "Prod_Web"
  }
}