resource "aws_secretsmanager_secret_version" "aws_access_key" {
  secret_id = "aws_access_key"
}

resource "aws_secretsmanager_secret_version" "aws_secret_key" {
  secret_id = "aws_secret_key"
}

resource "aws_secretsmanager_secret_version" "github_token" {
  secret_id = "github token"
}

locals {
  accesskey = jsondecode(aws_secretsmanager_secret_version.aws_access_key.secret_string)
}

locals {
  secretkey = jsondecode(aws_secretsmanager_secret_version.aws_secret_key.secret_string)
}

locals {
  githubToken = jsondecode(aws_secretsmanager_secret_version.github-token.secret_string)
}