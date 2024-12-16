//iam role for lambda
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "lambda_policy_attachment"{
    name = "lambda_policy_attachment"
    roles = [aws_iam_role.iam_for_lambda.name]
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# //iam role for codebuild
# resource "aws_iam_role" "iam_for_codebuild" {

# }

# //iam policy for codebuild
# resource "aws_iam_role_policy" "codebuild_policy" {

# }