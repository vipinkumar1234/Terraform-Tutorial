provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "Example_sg" {
  name = "Example_sg"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
}

resource "aws_instance" "Prod" {
  ami = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"

  lifecycle {
    replace_triggered_by = [ aws_security_group.Example_sg ]
  }
}
