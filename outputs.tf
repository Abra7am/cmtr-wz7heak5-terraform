output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
    aws_subnet.public_c.id
  ]
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance (if created)"
  value = (
    var.enable_ec2
    ? aws_instance.cmtr_wz7heak5_ec2[0].public_ip
    : null
  )
}