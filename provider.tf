terraform {
  backend "s3" {
    bucket         = "my-terraform-bucket22"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile   = true   # replaces dynamodb_table
  }
}


provider "aws" {
  region = var.aws_region
}

