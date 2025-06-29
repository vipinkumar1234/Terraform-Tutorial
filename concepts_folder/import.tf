provider "aws" {
  region = "us-east-1"
}

import {
  # Specifies the target resource type and name in the Terraform configuration
  to = aws_security_group.mysg

  # The actual ID of the existing AWS Security Group to be imported
  id = "sg-01012ef5434664c58"
}