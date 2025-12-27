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
  default     = null

  validation {
    condition     = var.enable_ec2 == false || var.ssh_key != null
    error_message = "ssh_key must be provided when enable_ec2 is true."
  }
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

