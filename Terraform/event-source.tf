resource "aws_lambda_event_source_mapping" "dynamo_event" {
  event_source_arn  = aws_dynamodb_table.dynamodb-table1.stream_arn
  function_name     = aws_lambda_function.sns_lambda.arn
  starting_position = "LATEST"
  batch_size = 1
}


resource "aws_lambda_event_source_mapping" "dynamo_event2" {
  event_source_arn  = aws_dynamodb_table.dynamodb-table1.stream_arn
  function_name     = aws_lambda_function.slack_lambda.arn
  starting_position = "LATEST"
  batch_size = 1
}


