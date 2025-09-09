
terraform {
  backend "s3" {
    bucket         = "my-terraform-bucket22"
    key            = "state/terraform.tfstate"
    region         = "ap-south-1"   # 👈 must match the bucket region
    dynamodb_table = "terraform-locks" # if you use it
    encrypt        = true
  }
}



provider "aws" {
  region = var.aws_region
}

