# Security group
resource "aws_security_group" "jenkins_sg" {
  name        = var.security_group
  description = "Allow SSH & Jenkins traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group
  }
}

# Use default VPC
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# EC2 instance for Jenkins
resource "aws_instance" "jenkins" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = element(data.aws_subnets.default.ids, 0)
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  tags = {
    Name = var.tag_name
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y openjdk-17-jdk wget gnupg
              wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
              sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
              apt-get update -y
              apt-get install -y jenkins
              systemctl enable jenkins
              systemctl start jenkins
              EOF
}

# Elastic IP
resource "aws_eip" "jenkins_eip" {
  instance = aws_instance.jenkins.id
  vpc      = true
}
