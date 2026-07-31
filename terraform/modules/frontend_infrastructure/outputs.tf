output "bucket_name" {
  description = "Name of the frontend S3 bucket."
  value       = aws_s3_bucket.frontend.id
}

output "bucket_arn" {
  description = "ARN of the frontend S3 bucket."
  value       = aws_s3_bucket.frontend.arn
}

output "cloudfront_distribution_id" {
  description = "ID of the frontend CloudFront distribution."
  value       = aws_cloudfront_distribution.frontend.id
}

output "cloudfront_distribution_arn" {
  description = "ARN of the frontend CloudFront distribution."
  value       = aws_cloudfront_distribution.frontend.arn
}

output "cloudfront_domain" {
  description = "CloudFront domain name."
  value       = aws_cloudfront_distribution.frontend.domain_name
}

output "cloudfront_zone_id" {
  description = "CloudFront Route 53 hosted zone ID."
  value       = aws_cloudfront_distribution.frontend.hosted_zone_id
}