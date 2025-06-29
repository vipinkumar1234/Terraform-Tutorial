######## Provider  ##############
provider "aws" {
    region = "us-east-1"
  
}

######## VPC ##############

resource "aws_vpc" "Prod-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Prod-VPC"
  }
}

########## Subent #############

resource "aws_subnet" "Prod-Subnet" {
  vpc_id     = aws_vpc.Prod-VPC.id
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Prod-Subnet"
  }
}

################ IGW #################

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.Prod-VPC.id

  tags = {
    Name = "Prod-IGW"
  }
}

############## Route table #################

resource "aws_route_table" "Prod-RT" {
  vpc_id = aws_vpc.Prod-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }


  tags = {
    Name = "Prod-RT"
  }
}

############## Route Table Association ############

resource "aws_route_table_association" "Prod-RT-Association" {
  subnet_id      = aws_subnet.Prod-Subnet.id
  route_table_id = aws_route_table.Prod-RT.id
}

################ Security Group ############

resource "aws_security_group" "Prod-SG" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.Prod-VPC.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.Prod-VPC.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Prod-SG"
  }
}

###################  EC2 #########################

resource "aws_instance" "Prod-EC2" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t3.micro"
  key_name = "cmdemo1"
  subnet_id = aws_subnet.Prod-Subnet.id
  vpc_security_group_ids =  [aws_security_group.Prod-SG.id]
  

  tags = {
    Name = "Prod_EC2"
  }
}