resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-s3-bucket"
  acl    = "public-read-write"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "$"
        sse_algorithm = "aws:kms"
      }
    }
  }

  logging {
    target_bucket = "logging_bucket"
    target_prefix = "log/"
  }

  tags = {
    Name        = "my-s3-bucket"
    Environment = "production"
  }
}
