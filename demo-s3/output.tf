output "arn" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3.arn
}

output "bucket" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3.bucket
}

output "tags_all" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3.tags_all.Name
}