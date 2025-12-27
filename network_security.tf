#######################################
# SSH Security Group
#######################################

resource "aws_security_group" "ssh_sg" {
  name   = "cmtr-wz7heak5-ssh-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_range
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.allowed_ip_range
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "cmtr-wz7heak5"
  }
}

#######################################
# Public HTTP Security Group (Port 80)
#######################################

resource "aws_security_group" "public_http_sg" {
  name   = "cmtr-wz7heak5-public-http-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_range
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.allowed_ip_range
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "cmtr-wz7heak5"
  }
}

#######################################
# Private HTTP Security Group (Port 8080)
#######################################

resource "aws_security_group" "private_http_sg" {
  name   = "cmtr-wz7heak5-private-http-sg"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "cmtr-wz7heak5"
  }
}

#######################################
# Security Group Rules (SG → SG)
#######################################

resource "aws_security_group_rule" "private_http_from_public_http" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.private_http_sg.id
  source_security_group_id = aws_security_group.public_http_sg.id
}

resource "aws_security_group_rule" "private_icmp_from_public_http" {
  type                     = "ingress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "icmp"
  security_group_id        = aws_security_group.private_http_sg.id
  source_security_group_id = aws_security_group.public_http_sg.id
}

#######################################
# Existing EC2 Instances (Data Sources)
#######################################

data "aws_instance" "public_instance" {
  instance_id = var.public_instance_id
}

data "aws_instance" "private_instance" {
  instance_id = var.private_instance_id
}

#######################################
# Attach Security Groups to ENIs
#######################################

# Public EC2
resource "aws_network_interface_sg_attachment" "public_ssh" {
  security_group_id    = aws_security_group.ssh_sg.id
  network_interface_id = data.aws_instance.public_instance.network_interface_id
}

resource "aws_network_interface_sg_attachment" "public_http" {
  security_group_id    = aws_security_group.public_http_sg.id
  network_interface_id = data.aws_instance.public_instance.network_interface_id
}

# Private EC2
resource "aws_network_interface_sg_attachment" "private_ssh" {
  security_group_id    = aws_security_group.ssh_sg.id
  network_interface_id = data.aws_instance.private_instance.network_interface_id
}

resource "aws_network_interface_sg_attachment" "private_http" {
  security_group_id    = aws_security_group.private_http_sg.id
  network_interface_id = data.aws_instance.private_instance.network_interface_id
}
