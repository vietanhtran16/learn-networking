resource "aws_instance" "internet-vpc-bastion" {
  ami  = "${var.ami}"
  instance_type = "t1.micro"
  key_name = "${aws_key_pair.default.id}"
  subnet_id = "${aws_subnet.public-subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.internet-vpc-bastion-sg.id}"]
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "${file("install.sh")}"
  availability_zone = "ap-southeast-2a"

  lifecycle {
    ignore_changes = ["user_data"]
  } 
  tags {
    Name = "internet-vpc-bastion"
  }
}

resource "aws_instance" "ec2-with-internet" {
  ami  = "${var.ami}"
  instance_type = "t1.micro"
  key_name = "${aws_key_pair.default.id}"
  subnet_id = "${aws_subnet.public-subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.internet-vpc-bastion-sg.id}"]
  
  source_dest_check = false
  user_data = "${file("install.sh")}"
  availability_zone = "ap-southeast-2a"

  lifecycle {
    ignore_changes = ["user_data"]
  } 
  tags {
    Name = "ec2-with-internet"
  }
}