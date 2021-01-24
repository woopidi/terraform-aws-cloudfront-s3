resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = var.domain_name
}

resource "aws_cloudfront_distribution" "cloudfront" {
  enabled      = true
  price_class  = "PriceClass_200"
  http_version = "http2"
  aliases      = concat([var.domain_name], var.other_domains)

  origin {
    origin_id   = "origin-bucket-${aws_s3_bucket.bucket.id}"
    domain_name = "${var.domain_name}.s3.${var.region}.amazonaws.com"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "origin-bucket-${aws_s3_bucket.bucket.id}"

    min_ttl     = "0"
    default_ttl = "300"  //3600
    max_ttl     = "1200" //86400

    viewer_protocol_policy = "redirect-to-https"
    compress               = true

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.cert_arn
    ssl_support_method  = "sni-only"
    cloudfront_default_certificate = false
    minimum_protocol_version = "TLSv1.2_2019"
  }

}
