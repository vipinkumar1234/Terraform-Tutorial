# The default provider configuration; resources that begin with `aws_` will use
# it as the default, and it can be referenced as `aws`.
provider "aws" {
  region = "us-east-1"
}

# Additional provider configuration for west coast region; resources can
# reference this as `aws.west`.
provider "aws" {
  alias  = "east"
  region = "us-east-2"
}

resource "aws_instance" "Prod-Web" {
  provider = aws
  ami = "ami-0dbc3d7bc646e8516"
  instance_type = "t2.micro"

  tags = {
    Name = "Prod-Web_server"
  }
  
}

resource "aws_instance" "Dev-Web" {
  provider = aws.east
  ami = "ami-0fa399d9c130ec923"
  instance_type = "t2.micro"

  tags = {
    Name = "Dev-Web_server"
  }
  
}
