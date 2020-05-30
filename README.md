# CloudFront S3

```sh
module "example" {
    source = "git@gitlab.woopidi.net:terraform/cloudfront-s3.git"
    domain_names = ["app.example.com"]
    cert_arn = "...cert arn"
}

```

## Output

* module.example.cloudfront_domain_name
* module.example.cloudfront_hosted_zone_id