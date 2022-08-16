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
  region = "us-east-1"
  profile                  = "MrZeta"
  shared_credentials_files = ["/home/zee/.aws/credentials"]
}

resource "aws_instance" "app_server" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"


  tags = {
    Name = "ExAppServerInstance"
    # Name = var.instance_name
  }
}