# provider info. Region set in variables.tf folder

data "aws_dynamodb_table" "demo_table" {
    name = "unichicago"
}

provider "aws" {
  region = "us-east-1"
}