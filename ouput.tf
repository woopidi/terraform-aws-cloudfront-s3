output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.cloudfront.domain_name
}

output "cloudfront_hosted_zone_id" {
  value = aws_cloudfront_distribution.cloudfront.hosted_zone_id
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.bucket.bucket_domain_name
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.bucket.bucket_regional_domain_name
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.id
}
