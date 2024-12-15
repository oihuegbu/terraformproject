resource "aws_secretsmanager_secret_version" "uchicago_aws_access_key" {
  secret_id = "unichiawsaccesskey"
}

resource "aws_secretsmanager_secret_version" "uchicago_aws_secret_key" {
  secret_id = "unichiawssecretkey"
}

# resource "aws_secretsmanager_secret_version" "github_token" {
#   secret_id = "github token"
# }

locals {
  ucaccesskey = jsondecode(aws_secretsmanager_secret_version.uchicago_aws_access_key.secret_string)
}

locals {
  ucsecretkey = jsondecode(aws_secretsmanager_secret_version.uchicago_aws_secret_key.secret_string)
}

# locals {
#   githubToken = jsondecode(aws_secretsmanager_secret_version.github_token.secret_string)
# }



# output "example" {
#   value = jsondecode(aws_secretsmanager_secret_version.example.secret_string)["key1"]
# }