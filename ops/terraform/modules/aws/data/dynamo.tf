resource "aws_dynamodb_table" "lock_table" {
  name         = "tflock-${var.service_name}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
