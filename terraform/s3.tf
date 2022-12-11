resource "aws_s3_bucket" "twitterarchive-bucket" {
  bucket = "twitterarchive.gaunt.dev"
  tags   = local.tags
}

resource "aws_s3_bucket_acl" "twitterarchive-bucket-acl" {
  bucket = aws_s3_bucket.twitterarchive-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_object" "short-term-cache" {
  for_each = fileset("../public/", "*.{html,xml,json}")
  bucket = aws_s3_bucket.twitterarchive-bucket.id
  key = each.value
  source = "../public/${each.value}"
  etag = filemd5("../public/${each.value}")
  acl = "public-read"
  cache_control = "max-age=86400"
}
