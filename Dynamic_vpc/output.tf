output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = aws_subnet.subnet.id
}

output "ec2_public_ip" {
  value = aws_instance.ec2.public_ip
}

output "aws_ami" {
  value = data.aws_ami.ubuntu.id
}