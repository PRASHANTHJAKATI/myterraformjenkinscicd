variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name (Terraform will add random suffix)."
  type        = string
  default     = "my-terraform-bucket22"
}

variable "acl" {
  description = "Canned ACL to apply"
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Enable or disable versioning"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the bucket"
  type        = map(string)
  default = {
    Name        = "terraform-state-bucket"
    Environment = "dev"
  }
}

