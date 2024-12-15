# provider info. Region set in variables.tf folder
provider "aws" {
  region = "us-east-1"
  access_key = local.accesskey.unichicago_access_key
  secret_key = local.secretkey.unichicago_secret_key
}