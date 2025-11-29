data "aws_vpc" "cmtr_vpc" {
  filter {
    name   = "tag:Name"
    values = ["cmtr-wz7heak5-vpc"]
  }
}

data "aws_subnet" "public_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.cmtr_vpc.id]
  }

  filter {
    name   = "availability-zone"
    values = ["us-east-1a"]
  }
}

data "aws_security_group" "cmtr_sg" {
  filter {
    name   = "group-name"
    values = ["cmtr-wz7heak5-sg"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.cmtr_vpc.id]
  }
}
resource "aws_instance" "cmtr_ec2" {
  ami           = "ami-0fa3fe0fa7920f68ec"
  instance_type = "t2.micro"

  key_name = aws_key_pair.cmtr_keypair.key_name

  subnet_id              = data.aws_subnet.public_a.id
  vpc_security_group_ids = [data.aws_security_group.cmtr_sg.id]

  tags = {
    Project = "epam-tf-lab"
    ID      = "cmtr-wz7heak5"
  }
}
