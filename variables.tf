variable "profile" {
  description = "AWS CLI profile used for authentication"
  type        = string
}

variable "region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "base_name" {
  description = "Base prefix for all resource names"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_a_cidr" {
  description = "CIDR block for public subnet in availability zone us-east-1a"
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for public subnet in availability zone us-east-1b"
  type        = string
}

variable "public_subnet_c_cidr" {
  description = "CIDR block for public subnet in availability zone us-east-1c"
  type        = string
}
