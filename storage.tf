# storage.tf
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "storage" {
  bucket = "cmtr-wz7heak5-bucket-1766833216"

  tags = {
    Project = "cmtr-wz7heak5"
  }
}
