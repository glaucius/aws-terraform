resource "aws_s3_bucket" "b" {
  bucket = "glauciushabucketnewhorizon2020"
  acl    = "private"

  tags = {
    Name        = "glauciushabucketnewhorizon2020"
  }
}