resource "aws_security_group" "cmtr_wz7heak5_sg" {
  count       = var.enable_ec2 ? 1 : 0
  name        = "cmtr-wz7heak5-sg"
  description = "Allow SSH access"
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "epam-tf-lab"
    ID      = "cmtr-wz7heak5"
  }
}

resource "aws_instance" "cmtr_wz7heak5_ec2" {
  count         = var.enable_ec2 ? 1 : 0
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_a.id

  key_name = aws_key_pair.cmtr_wz7heak5_keypair[0].key_name

  vpc_security_group_ids = [
    aws_security_group.cmtr_wz7heak5_sg[0].id
  ]

  associate_public_ip_address = true

  tags = {
    Name    = "cmtr-wz7heak5-ec2"
    Project = "epam-tf-lab"
    ID      = "cmtr-wz7heak5"
  }
}
