provider "aws" {
  region = "ap-south-1"  # Change as needed
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-05c179eced2eb9b5b"  # Update with the latest Amazon Linux 2 AMI
  instance_type = "t2.micro"
  

  tags = {
    Name = "MyTerraformEC2"
  }

  security_groups = [aws_security_group.allow_ssh.name]
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # WARNING: Open to all. Restrict this in production.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




