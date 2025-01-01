provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "Youtube" {
  name = "Youtube${count.index+1}"
  count = 10
}

output "name" {
  value = aws_iam_user.Youtube[*].name
}

output "arns" {
  value = aws_iam_user.Youtube[*].arn
}

output "combined" {
  value = zipmap(aws_iam_user.Youtube[*].name,aws_iam_user.Youtube[*].arn)
}