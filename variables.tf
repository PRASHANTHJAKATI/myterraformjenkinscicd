variable "aws_region" {
  description = "AWS region for resources"
  default     = "eu-north-1"
}

variable "key_name" {
  description = "SSH key pair name for EC2"
  default     = "jenkins"
}

variable "instance_type" {
  description = "EC2 instance type for Jenkins"
  default     = "t3.micro"
}

variable "tag_name" {
  description = "Tag for EC2 instance"
  default     = "JenkinsServer"
}

variable "ami_id" {
  description = "AMI ID for Jenkins EC2 (Ubuntu recommended)"
  default     = "ami-0c4fc5dcabc9df21d"
}

variable "security_group" {
  description = "Security group name for Jenkins server"
  default     = "jenkins-sg"
}
