variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
}

variable "project_name" {
  description = "Project identifier"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_public_a_cidr" {
  description = "CIDR for public subnet A"
  type        = string
}

variable "subnet_public_b_cidr" {
  description = "CIDR for public subnet B"
  type        = string
}

variable "subnet_public_c_cidr" {
  description = "CIDR for public subnet C"
  type        = string
}

variable "enable_ec2" {
  description = "Whether to create EC2 and SSH resources"
  type        = bool
}


variable "ssh_key" {
  description = "Provides custom public SSH key."
  type        = string
  default     = ""
}


variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "iam_s3_bucket_name" {
  description = "S3 bucket name used in IAM policy"
  type        = string
}

variable "allowed_ip_range" {
  description = "List of allowed IP ranges for secure access"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID provided by the platform"
  type        = string
}

variable "public_instance_id" {
  description = "Public EC2 instance ID"
  type        = string
}

variable "private_instance_id" {
  description = "Private EC2 instance ID"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID"
  type        = string
}
