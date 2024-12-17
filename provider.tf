# provider info. Region set in variables.tf folder

data "aws_dynamodb_table" "demo_table" {
    name = "unichicago"
}

provider "aws" {
  region = "us-east-1"
  //access_key = local.ucaccesskey.unichiaccesskey
  # access_key = data.aws_ssm_parameter.unichi_access_key.value
  # secret_key = data.aws_ssm_parameter.unichi_secret_key.value
  //secret_key = local.ucsecretkey.unichisecretkey
}