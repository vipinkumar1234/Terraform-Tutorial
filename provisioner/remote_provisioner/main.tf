# security_group.tf

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow incoming SSH traffic"
  vpc_id      = "vpc-00e5cc802221cfa1c"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust this to your specific IP or range
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# main.tf

resource "aws_instance" "Test" {
  ami                    = "ami-008fe2fc65df48dac"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name               = "provisioner"  # Replace with the correct key pair name
  subnet_id              = "subnet-02625e9fad8673166"
  
  tags = {
    Name = "TestInstance"
  }

  # Use the remote-exec provisioner to run commands on the newly created EC2 instance
  provisioner "remote-exec" {
    inline = [
      "echo 'Hello, World!' > hello.txt",
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "mkdir /home/ubuntu/test",
      "touch /home/ubuntu/test/example_file.txt"
    ]

    # Connect to the EC2 instance using SSH
    connection {
      type        = "ssh"
      user        = "ubuntu"  # Change this to the appropriate username for your AMI
      private_key = file("./provisioner.pem")  # Use relative path to the private key
      host        = self.public_ip  # Use self to refer to the current resource (aws_instance.Test)
    }
  }
}