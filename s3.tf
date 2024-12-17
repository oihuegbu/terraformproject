
//lambda bucket
resource "aws_s3_bucket" "lambda_bucket" {
    bucket = "uchicago-lambda-code-bucket"
}

resource "aws_s3_object" "lambda_code" {
    bucket = aws_s3_bucket.lambda_bucket.bucket
    key    = "lambda_function.zip"
    source = "lambda_function.zip"
}

# data "aws_s3_bucket" "ucodepipeline_bucket" {
#     bucket = "unichicago-codepipeline-bucket"
# }

resource "aws_s3_bucket" "ucodepipeline_bucket" {
    bucket = "demo-codepipeline-bucket"
    force_destroy = true
}