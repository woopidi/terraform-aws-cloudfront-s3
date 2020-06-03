resource "aws_s3_bucket" "bucket" {
  bucket = var.domain_name
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid       = "Get"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]

    principals {
      type = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
      ]
    }
  }

  statement {
    sid       = "list"
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.bucket.arn]

    principals {
      type = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
      ]
    }
  }
}

resource "aws_s3_bucket_policy" "policy_attachment" {
  bucket = aws_s3_bucket.bucket.id
  policy = concat(data.aws_iam_policy_document.bucket_policy.json, var.bucket_policy)
}
