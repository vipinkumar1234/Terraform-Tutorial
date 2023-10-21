resource "aws_instance" ".MyInstance" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t3.micro"

  tags = {
    Name = "Prod_Web"
  }
}