# Specify the AWS provider and the region where resources will be created
provider "aws" {
  region = "us-east-1"
}

# Define a variable to hold the list of allowed ports
# These ports will be used to create ingress rules in the security group
variable "allowed_ports" {
  type    = list(number) # Specifies that the variable is a list of numbers
  default = [8080, 8081, 22, 443, 5050] # Default ports allowed for incoming traffic
}

# Create an AWS Security Group resource
resource "aws_security_group" "Test-sg" {
  name = "Youtube-test-sg" # Name of the security group

  # Use a dynamic block to iterate over the allowed ports
  # For each port in the `allowed_ports` list, create an ingress rule
  dynamic "ingress" {
    for_each = var.allowed_ports # Iterate over the list of allowed ports
    iterator = port # Iterator variable representing each port in the list
    content {
      from_port   = port.value # The starting port for the ingress rule
      to_port     = port.value # The ending port for the ingress rule
      protocol    = "tcp"      # Protocol for the ingress rule (TCP)
      cidr_blocks = ["0.0.0.0/0"] # Allow traffic from any IP address (open to the world)
    }
  }
}
