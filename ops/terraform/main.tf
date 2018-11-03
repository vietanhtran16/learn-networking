terraform {
  backend "s3" {
    key = "terraform.tfstate"
    region = "ap-southeast-2"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-southeast-2"
}