data "aws_iam_policy_document" "dynamo_data" {
  statement {
    sid       = "VisualEditor0"
    effect    = "Allow"
    resources = [aws_dynamodb_table.dynamodb-table1.arn]

    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem",
      "dynamodb:Query",
      "dynamodb:UpdateItem"
    ]
  }
}


data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}


data "aws_iam_policy_document" "lambda_basic_exec" {
  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:logs:us-east-1:237301564654:*"]
    actions   = ["logs:CreateLogGroup"]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:logs:us-east-1:237301564654:log-group:/aws/lambda/blb_lambda:*"]

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
  }
}


data "aws_iam_policy_document" "stream_data" {
  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:lambda:us-east-1:237301564654:function:notification_lambda"]
    actions   = ["lambda:InvokeFunction"]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:dynamodb:us-east-1:237301564654:table/Counter/stream/2022-08-28T18:35:13.721"]

    actions = [
      "dynamodb:DescribeStream",
      "dynamodb:GetRecords",
      "dynamodb:GetShardIterator",
      "dynamodb:ListStreams",
    ]
  }
}


data "aws_iam_policy_document" "sns_data" {
  statement {
    sid       = "AllowPublishToMyTopic"
    effect    = "Allow"
    resources = ["arn:aws:sns:us-east-1:237301564654:DynamoDBUpdates"]
    actions   = ["sns:Publish"]
  }
}