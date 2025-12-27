resource "aws_iam_group" "this" {
  name = "cmtr-wz7heak5-iam-group"
}

# IAM Policy (custom, S3 write-only)
resource "aws_iam_policy" "this" {
  name = "cmtr-wz7heak5-iam-policy"

  policy = templatefile(
    "${path.module}/policy.json",
    {
      bucket_name = var.iam_s3_bucket_name
    }
  )

  tags = {
    Project = "cmtr-wz7heak5"
  }
}

# IAM Role (assumable by EC2)
resource "aws_iam_role" "this" {
  name = "cmtr-wz7heak5-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Project = "cmtr-wz7heak5"
  }
}

# Attach policy to role
resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

# Instance Profile
resource "aws_iam_instance_profile" "this" {
  name = "cmtr-wz7heak5-iam-instance-profile"
  role = aws_iam_role.this.name

  tags = {
    Project = "cmtr-wz7heak5"
  }
}
