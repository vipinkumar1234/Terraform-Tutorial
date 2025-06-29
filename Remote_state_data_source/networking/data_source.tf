data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-native-state-locking-youtube"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
    }
  }