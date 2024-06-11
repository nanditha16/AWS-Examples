resource "aws_s3_bucket" "tf-s3-bucket" {
  bucket = "aws-practice-nan1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}