output "Bucket ARN" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3.arn
}

output "Bucket Name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3.bucket
}

output "Name Tag" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3.tags_all.Name
}