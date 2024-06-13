# Define required provider for AWS
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.53.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"  # Specify your desired AWS region here
}

# Define an S3 bucket resource
resource "aws_s3_bucket" "default" {
  bucket = "aws-tf-practice-nan1"  # Set the name of the S3 bucket to create
}

# Define an S3 object resource
resource "aws_s3_object" "object" {
  # Reference the bucket created above
  bucket = aws_s3_bucket.default.bucket
  # Set the key (name) of the object within the bucket
  key    = "etag_1.txt"
  # Specify the local file path of the file to upload to S3
  source = "/tmp/s3-bash-scripts/etag_1.txt"
  # Calculate the ETag of the source file
  etag   = filemd5("/tmp/s3-bash-scripts/etag_1.txt")
}







