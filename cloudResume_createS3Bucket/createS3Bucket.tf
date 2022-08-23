terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
  profile                  = "MrZeta"
  shared_credentials_files = ["/home/zee/.aws/credentials"]

}

resource "aws_s3_bucket" "createCloudResume" {
  #SEE bucket naming conventions: https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html 
  bucket = var.website_bucket

  tags = {
    "Name" = "cloudResume22"
  }
}

resource "aws_s3_bucket_website_configuration" "setConfig" {
  bucket = var.website_bucket
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_acl" "setACL" {
  bucket = var.website_bucket
  acl    = "public-read"
}

resource "aws_s3_object" "uploadObj" {
  bucket = var.website_bucket
  source = "docs/index.html"
  key    = "index.html"
}

resource "aws_s3_bucket_policy" "setBucketPolicy" {
  bucket = var.website_bucket

  policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "PublicReadGetObject",
                "Effect": "Allow",
                "Principal": "*",
                "Action": [
                    "s3:GetObject"
                ],
                "Resource": [
                    "arn:aws:s3:::${var.website_bucket}/*"
                ]
            }
        ]
}
POLICY
}