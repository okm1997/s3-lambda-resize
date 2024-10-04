# S3 Buckets
resource "aws_s3_bucket" "bucket_a" {
  bucket = var.elred_bucket_a
}

resource "aws_s3_bucket" "bucket_b" {
  bucket = var.elred_bucket_b
}