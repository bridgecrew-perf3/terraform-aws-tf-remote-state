variable "bucket_name" {
  description = "AWS S3 Bucket name used for storing terraform state files"
  type        = string
  default     = null
}

variable "tf_state_bucket_name" {
  description = <<EOF
AWS S3 Bucket name used for storing terraform state files. 
Recommended to only use when the bucket name is implicitly set via
terragrunt input inheritance through include{} block. `var.bucket_name` will take 
precedence over this variable.
EOF
  type        = string
  default     = null
}

variable "db_table_name" {
  description = "AWS DynamoDB table name used for locking terraform state"
  type        = string
  default     = null
}

variable "tf_state_locking_db_table_name" {
  description = <<EOF
AWS DynamoDB table name used for locking terraform state.
Recommended to only use when the db name is implicitly set via
terragrunt input inheritance through include{} block. `var.db_name` will take 
precedence over this variable.
EOF
  type        = string
  default     = null
}


variable "bucket_tags" {
  description = "Tags to attach to S3 bucket"
  type        = map(string)
  default     = {}
}

variable "db_table_tags" {
  description = "Tags to attach to DyanmoDB table"
  type        = map(string)
  default     = {}
}

variable "common_tags" {
  description = "Tags to attach to both S3 bucket and DynamoDB table"
  type        = map(string)
  default     = {}
}