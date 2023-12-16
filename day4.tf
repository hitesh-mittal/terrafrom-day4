terraform {


  required_version = "~>1.6.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.29.0"

    }
  }
}
provider "aws" {
  
  region = "us-east-1"
}

resource "aws_instance" "day3_instance" {
  ami           = data.aws_ami.amazonlinux.id
  instance_type = "t3.micro"
  key_name = "public"
  count=1
  
        

tags = {
    Name = "my-ec2-"
  }
}

data "aws_ami" "amazonlinux" {
  
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

