resource "aws_iam_role" "lambda_dynamodb_role" {
  name               = "lambda_dynamodb_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json

}


resource "aws_iam_policy_attachment" "lambda_dynamodb_role_attach" {
  for_each = toset(var.policies)
  name     = "role-attachment"
  roles    = [aws_iam_role.lambda_dynamodb_role.name]

  policy_arn = each.value
}