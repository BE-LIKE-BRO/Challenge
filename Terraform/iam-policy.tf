resource "aws_iam_policy" "lambda_dynamodb" {
  name        = "lambda_dynamodb_policy"
  description = "Policy to let lambda access dynamodb"

  policy = data.aws_iam_policy_document.dynamo_data.json
}


resource "aws_iam_policy" "lambda_basic_exec_policy" {
  name        = "lambda_basic_exec_policy"
  description = "Lambda basic execution policy"

  policy = data.aws_iam_policy_document.lambda_basic_exec.json
}


resource "aws_iam_policy" "stream_policy" {
  name        = "Dynamodb_stream_policy"
  description = "Dynamodb_stream_policy"

  policy = data.aws_iam_policy_document.stream_data.json
}


resource "aws_iam_policy" "sns" {
  name        = "lambda_sns_policy"
  description = "lambda_sns_policy"

  policy = data.aws_iam_policy_document.sns_data.json
}