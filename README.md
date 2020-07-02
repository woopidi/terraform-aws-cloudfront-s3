# Terraform AWS CloudFront S3 Module

```sh
module "example" {
    source          = "git@github.com:woopidi/terraform-aws-cloudfront-s3.git"
    domain_names    = ["app.example.com"]
    cert_arn        = "...cert arn"
}

```

## Outputs

```sh
{
    donmain_name    = module.example.cloudfront_domain_name
    zone_id         = module.example.cloudfront_hosted_zone_id
    bucket_arn      = module.example.bucket_arn
}
```