# provider info. Region set in variables.tf folder
provider "aws" {
  region = "us-east-1"
  access_key = local.ucaccesskey.unichiaccesskey
  secret_key = local.ucsecretkey.unichisecretkey
}