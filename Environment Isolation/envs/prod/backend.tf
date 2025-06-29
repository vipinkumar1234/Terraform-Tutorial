# terraform {
#   backend "s3" {
#     bucket         = "my-terraform-state-bucket"
#     key            = "prod/terraform.tfstate"
#     region         = "eu-west-3"
#     encrypt = true
#     use_lockfile = true
#   }
# }
