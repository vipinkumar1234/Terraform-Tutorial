terraform {
  backend "s3" {
    bucket = "terraform-native-state-locking-youtube"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}