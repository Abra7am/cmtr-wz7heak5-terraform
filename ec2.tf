


resource "aws_security_group" "cmtr_wz7heak5_sg" {
  name        = "cmtr-wz7heak5-sg"
  description = "Allow SSH inbound traffic"

  vpc_id = var.vpc_id


  ingress {
    description = "SSH from VPC"
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
  ami           = "ami-0fa3fe0fa7920f68ec"
  instance_type = "t2.micro"


  key_name = aws_key_pair.cmtr_wz7heak5_keypair.key_name


  subnet_id = var.subnet_id_public_a


  associate_public_ip_address = true


  vpc_security_group_ids = [aws_security_group.cmtr_wz7heak5_sg.id]

  tags = {
    Name    = "cmtr-wz7heak5-ec2"
    Project = "epam-tf-lab"
    ID      = "cmtr-wz7heak5"
  }
}


output "instance_public_ip" {
  description = "The public IP address of the EC2 instance for SSH."
  value       = aws_instance.cmtr_wz7heak5_ec2.public_ip
}