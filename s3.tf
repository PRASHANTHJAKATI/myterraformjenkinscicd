# Create the S3 bucket
resource "aws_s3_bucket" "tf_state" {
  bucket = "my-terraform-bucket22"
}

# Apply tags separately
resource "aws_s3_bucket_tagging" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id

  tag_set = {
    Name        = "terraform-state-bucket"
    Environment = "dev"
  }
}

# Enable versioning
resource "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block public access
resource "aws_s3_bucket_public_access_block" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

