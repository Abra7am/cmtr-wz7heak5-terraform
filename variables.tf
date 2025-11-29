

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