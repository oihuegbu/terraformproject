# provider info. Region set in variables.tf folder
provider "aws" {
  region = "us-east-1"
  //access_key = local.ucaccesskey.unichiaccesskey
  access_key = $/UC_KEY/UC_ACCESS_KEY
  secret_key = $/UC_SECRET/UC_SECRET_KEY
  //secret_key = local.ucsecretkey.unichisecretkey
}