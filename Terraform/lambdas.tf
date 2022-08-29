resource "aws_lambda_function" "lambda_function" {

  filename         = "code.zip"
  description      = ""
  source_code_hash = filebase64sha256("code.zip")
  function_name    = "blb_lambda"
  role             = aws_iam_role.lambda_dynamodb_role.arn
  handler          = "code.lambda_handler"
  runtime          = "python3.9"
  memory_size      = 128
  timeout          = 3
  publish          = true

}


resource "aws_lambda_function" "sns_lambda" {

  filename         = "sns.zip"
  description      = ""
  source_code_hash = filebase64sha256("sns.zip")
  function_name    = "notification_lambda"
  role             = aws_iam_role.lambda_dynamodb_role.arn
  handler          = "sns.lambda_handler"
  runtime          = "python3.9"
  memory_size      = 128
  timeout          = 3
  publish          = true

}


resource "aws_lambda_function" "slack_lambda" {

  filename         = "slack.zip"
  description      = ""
  source_code_hash = filebase64sha256("slack.zip")
  function_name    = "slack-lambda"
  role             = aws_iam_role.lambda_dynamodb_role.arn
  handler          = "slack.handler"
  runtime          = "nodejs14.x"
  memory_size      = 128
  timeout          = 3
  publish          = true

}