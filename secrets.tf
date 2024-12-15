resource "aws_secretsmanager_secret_version" "uchicago_aws_access_key" {
  secret_id = "aws_access_key"
}

resource "aws_secretsmanager_secret_version" "uchicago_aws_secret_key" {
  secret_id = "aws_secret_key"
}

resource "aws_secretsmanager_secret_version" "github_token" {
  secret_id = "github token"
}

locals {
  accesskey = jsondecode(aws_secretsmanager_secret_version.uchicago_aws_access_key.secret_string)
}

locals {
  secretkey = jsondecode(aws_secretsmanager_secret_version.uchicago_aws_secret_key.secret_string)
}

locals {
  githubToken = jsondecode(aws_secretsmanager_secret_version.github_token.secret_string)
}



# output "example" {
#   value = jsondecode(aws_secretsmanager_secret_version.example.secret_string)["key1"]
# }