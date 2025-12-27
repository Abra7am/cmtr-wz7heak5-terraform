aws_region   = "us-east-1"
project_name = "cmtr-wz7heak5"

vpc_cidr = "10.10.0.0/16"

subnet_public_a_cidr = "10.10.1.0/24"
subnet_public_b_cidr = "10.10.3.0/24"
subnet_public_c_cidr = "10.10.5.0/24"

instance_type      = "t2.micro"
ami_id             = "ami-068c0051b15cdb816"
s3_bucket_name     = "cmtr-wz7heak5-bucket-1766839074"
enable_ec2         = false
iam_s3_bucket_name = "cmtr-wz7heak5-bucket-1766840983"

allowed_ip_range = [
  "18.153.146.156/32",
  "104.28.216.174/32"
]

vpc_id            = "vpc-0c1f7d0168b668df1"
public_subnet_id  = "subnet-04781955ac4f856ad"
private_subnet_id = "subnet-0a48ca13d62f78486"

public_instance_id  = "i-02fe12385aeaa6c33"
private_instance_id = "i-028c9224b1a695cf4"

