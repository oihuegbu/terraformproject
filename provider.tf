# provider info. Region set in variables.tf folder

# data "aws_ssm_parameter" "unichi_access_key" {
#   name = "/UC_KEY/UC_ACCESS_KEY"
# }

# data "aws_ssm_parameter" "unicbi_secret_key" {
#   name = "/UC_SECRET/UC_SECRET_KEY"
# }

provider "aws" {
  region = "us-east-1"
  //access_key = local.ucaccesskey.unichiaccesskey
  # access_key = data.aws_ssm_parameter.unichi_access_key.value
  # secret_key = data.aws_ssm_parameter.unichi_secret_key.value
  //secret_key = local.ucsecretkey.unichisecretkey
}