resource "aws_key_pair" "default" {
  key_name = "viet-ssh-key"
  public_key = "${file("${var.key_path}")}"
}