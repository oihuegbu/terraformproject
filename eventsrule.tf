resource "aws_cloudwatch_event_rule" "every_5_mins" {
    name = "every-5-minutes"
    schedule_expression = "rate(5 minutes)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
    rule = aws_cloudwatch_event_rule.every_5_mins.name
    target_id = "uchicagoLambdaFunction"
    arn = aws_lambda_function.uchicago_lambda.arn
}