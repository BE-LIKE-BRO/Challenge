resource "aws_sns_topic" "sns_topic" {
  name = "DynamoDBUpdates"
}


resource "aws_sns_topic_subscription" "sns_subscription" {
  for_each = toset(var.emails)
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = each.value
}