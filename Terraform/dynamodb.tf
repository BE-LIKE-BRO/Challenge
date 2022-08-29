resource "aws_dynamodb_table" "dynamodb-table1" {
  name           = "Counter"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "ID"
  stream_enabled = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "ID"
    type = "S"
  }

  ttl {
    attribute_name = ""
    enabled        = false
  }

}
