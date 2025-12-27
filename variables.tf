variable "ssh_key" {
  description = "Provides custom public SSH key."
  type        = string

}

variable "vpc_id" {
  description = "The ID of the existing VPC to use."
  type        = string
}

variable "subnet_id_public_a" {
  description = "The ID of the public subnet in AZ us-east-1a."
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for the project"
  type        = string
  default     = "cmtr-wz7heak5-bucket-1766833216"
}
