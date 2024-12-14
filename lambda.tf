resource "aws_lambda_function" "uchicago_lambda" {
    function_name = "uchicagoLambdaFunction"
    s3_bucket = aws_s3_bucket.lambda_bucket.bucket
    s3_key = aws_s3_object.lambda_code.key
    role = aws_iam_role.iam_for_lambda.arn
    handler = "index.handler"
    runtime = "nodejs16.x"
    source_code_hash = filebase64sha256("lambda_function.zip")
}