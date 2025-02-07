provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "Test" {
  name = "iamuser.${count.index}"
  count = 10
}

output "arns" {
  value = aws_iam_user.Test[*].arn
}