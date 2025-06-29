provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0dbc3d7bc646e8516"
  instance_type = "t3.micro"
  count = 4
  
  
  tags = {
    Name = "web ${count.index}"
  }
}