resource "aws_s3_bucket" "storage" {
  bucket = var.s3_bucket_name

  tags = {
    Project = "cmtr-wz7heak5"
  }
}
