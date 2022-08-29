resource "aws_sns_topic" "sns_topic" {
  name = "DynamoDBUpdates"
}


resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = "ayoolacoul27@gmail.com"
}