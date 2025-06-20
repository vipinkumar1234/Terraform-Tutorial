provider "aws" {
    region = "us-east-1"
}

# Define a list of storage volumes with their sizes
variable "volume_sizes" {
    type    = list(number)
    default = [20, 30, 40, 50, 60]  # Adjust sizes as needed
}

resource "aws_instance" "prod" {
    ami           = "ami-080e1f13689e07408"  # Replace with your AMI ID
    instance_type = "t2.micro"
    count         = 5  # Create 5 instances

    # Use count.index to assign different storage volumes to each instance
    ebs_block_device {
        device_name           = "/dev/xvdf"  # Adjust device name as needed
        volume_size           = var.volume_sizes[count.index]
        volume_type           = "gp2"
        delete_on_termination = true
    }

    tags = {
        Name = "ProdInstance-${count.index + 1}"  # Tag each instance with a unique name
    }
}


