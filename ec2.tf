data "aws_security_group" "cmtr_sg" {
  filter {
    name   = "group-name"
    values = ["cmtr-wz7heak5-sg"]
  }
}

resource "aws_instance" "cmtr_ec2" {
  ami           = "ami-0fa3fe0fa7920f68e"
  instance_type = "t2.micro"

  key_name               = aws_key_pair.cmtr_keypair.key_name
  vpc_security_group_ids = [data.aws_security_group.cmtr_sg.id]

  tags = {
    Project = "epam-tf-lab"
    ID      = "cmtr-wz7heak5"
  }
}
