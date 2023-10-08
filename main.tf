terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}
provider "aws" {
  region= "us-east-2"
}
resource "aws_instance" "example" {
  ami="ami-0aec300fa613b1c92"
  instance_type= "t2.micro"
  security_groups=["aws_security_group.sai.name"]
  tags={
      Name= "Sai-Server1"
  }
}

resource "aws_security_group" "sai_securitygroup" {
  name        = "sai_securitygroup"
  description = "Allow TLS inbound traffic"
  vpc_id      = vpc-0beed584dea86fdbe

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sai_securitygroup"
  }
}
