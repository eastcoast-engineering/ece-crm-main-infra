output "bucket_name" {
  value = aws_s3_bucket.frontend.bucket
}

output "cloudfront_domain" {
  value = aws_cloudfront_distribution.frontend.domain_name
}

output "cloudfront_zone_id" {
  value = "Z2FDTNDATAQYW2" # always CloudFront zone ID
}