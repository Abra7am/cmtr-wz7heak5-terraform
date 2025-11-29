resource "aws_key_pair" "cmtr_wz7heak5_keypair" {
  key_name   = "cmtr-wz7heak5-keypair"
  public_key = var.ssh_key

  tags = {
    Project = "epam-tf-lab"
    ID      = "cmtr-wz7heak5"
  }
}