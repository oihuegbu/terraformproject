resource "aws_secretsmanager_secret_version" "github_token" {
  secret_id = "github token"
}

locals {
  githubToken = jsondecode(aws_secretsmanager_secret_version.github_token.secret_string)
}