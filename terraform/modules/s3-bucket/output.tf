# S3 Output Block
output "bucket_a_id" {
  value = aws_s3_bucket.bucket_a.id
}

output "bucket_a_arn" {
  value = aws_s3_bucket.bucket_a.arn
}

output "elred_bucket_b_name" {
  value = aws_s3_bucket.bucket_b.id
}