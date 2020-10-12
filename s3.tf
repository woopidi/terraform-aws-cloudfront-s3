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

  dynamic "statement" {
    for_each = var.bucket_policies

    content {
      sid       = statement.value.sid
      actions   = statement.value.actions
      resources = statement.value.resources

      principals {
        type = statement.value.type
        identifiers = statement.value.identifiers
      }
    }
  }
}

resource "aws_s3_bucket_policy" "policy_attachment" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}
