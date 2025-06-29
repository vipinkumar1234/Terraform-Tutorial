provider "aws" {
  region = "eu-west-3"
  profile = "dev"
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  env      = "dev"
}
