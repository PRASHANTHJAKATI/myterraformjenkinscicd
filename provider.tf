terraform {
  backend "s3" {
    bucket         = "my-terraform-bucket22"   # <-- Change to your bucket name
    key            = "cicd/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"       # For state locking
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}
