resource "aws_s3_bucket" "terraform_state" {
  bucket = coalesce(var.bucket_name, var.tf_state_bucket_name)

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = merge(var.bucket_tags, var.common_tags)
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = coalesce(var.db_table_name, var.tf_state_locking_db_table_name)
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = merge(var.db_table_tags, var.common_tags)
}