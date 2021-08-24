output "S3 Bucket name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3.id
}
