variable "region" {
  description = "AWS region for deployment"
  type        = string
}

variable "base_name" {
  description = "Base prefix for naming AWS resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
}

variable "public_subnet_a_cidr" {
  description = "CIDR for public subnet in us-east-1a"
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "CIDR for public subnet in us-east-1b"
  type        = string
}

variable "public_subnet_c_cidr" {
  description = "CIDR for public subnet in us-east-1c"
  type        = string
}
