terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
       version = "6.12.0"
    }
  }
}


provider "aws" {
  region     = "us-east-1"  # or your preferred region
  access_key = "AKIATE2YZM62ORTAZREW"       # optional if using environment variables
  secret_key = "6U49mZCKHMUXRfM/Uz5pRRHuZV+YqfCr7mHf2aIY"       # optional if using environment variables
}
resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl
  
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}
