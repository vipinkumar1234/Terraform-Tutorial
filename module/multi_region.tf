provider "aws" {
  region = "ap-southeast-1"
}

provider "aws" {
  alias = "us"
  region = "us-east-1"
}

provider "aws" {
  alias = "mumbai"
  region = "ap-south-1"
}