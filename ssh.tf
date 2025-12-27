resource "aws_key_pair" "cmtr_wz7heak5_keypair" {
  count      = var.enable_ec2 ? 1 : 0
  key_name   = "cmtr-wz7heak5-keypair"
  public_key = var.ssh_key

  lifecycle {
    precondition {
      condition     = var.enable_ec2 == false || length(var.ssh_key) > 0
      error_message = "ssh_key must be provided when enable_ec2 is true."
    }
  }

  tags = {
    Project = "epam-tf-lab"
    ID      = "cmtr-wz7heak5"
  }
}
