# CloudFront S3

```sh
module "example" {
    source = "git@gitlab.woopidi.net:terraform/cloudfront-s3.git"
    domain_name = "app.example.com"
    cert_arn = "...cert arn"
}

```