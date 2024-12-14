resource "aws_lambda_permission" "lambda_connect_eventbridge" {
    statement_id = "AllowExecutionFromEventBridge"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.uchicago_lambda.function_name
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.every_5_mins.arn
}