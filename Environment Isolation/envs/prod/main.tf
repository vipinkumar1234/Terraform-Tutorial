provider "aws" {
  region  = "eu-west-3"
  profile = "prod"
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.1.0.0/16"
  env      = "prod"
}
