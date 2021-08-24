output "Bucket_ARN" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3.arn
}

output "Bucket_Name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3.bucket
}

output "Name_Tag" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3.tags_all.Name
}