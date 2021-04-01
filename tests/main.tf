terraform {
  required_version = ">=0.14.8"
  required_providers {
    testing = {
      source  = "apparentlymart/testing"
      version = "0.0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "random" {}

resource "random_id" "this" {
  byte_length = 8
}

module "mut_aws_tf_remote_state" {
  source = "..//modules"
  bucket_name = lower("mut-aws-tf-remote-state-${random_id.this.id}")
  bucket_tags = {
    foo = "bar"
  }
  db_table_name = "tf_lock"
  db_table_tags = {
    foo = "bar"
  }
}

#TODO: Add test assertion to see if test tf state file is uploaded to bucket