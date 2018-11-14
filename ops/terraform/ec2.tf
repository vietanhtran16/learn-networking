resource "aws_instance" "public-instance" {
   ami  = "${var.ami}"
   instance_type = "t1.micro"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.public-subnet-sg.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("install.sh")}"

  tags {
    Name = "public-instance"
  }
}