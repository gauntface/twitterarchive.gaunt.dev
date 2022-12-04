resource "aws_s3_bucket" "twitterarchive-bucket" {
  bucket = "twitterarchive.gaunt.dev"
  tags   = local.tags
}

resource "aws_s3_bucket_acl" "twitterarchive-bucket-acl" {
  bucket = aws_s3_bucket.twitterarchive-bucket.id
  acl    = "private"
}
