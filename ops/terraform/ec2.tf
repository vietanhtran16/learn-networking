resource "aws_instance" "bastion-vpc-i" {
  ami  = "${var.ami}"
  instance_type = "t1.micro"
  key_name = "${aws_key_pair.default.id}"
  subnet_id = "${aws_subnet.public-subnet-vpc-i.id}"
  vpc_security_group_ids = ["${aws_security_group.vpn_server_sg.id}", "${aws_security_group.default-sg-vpc-i.id}"]
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "${file("install.sh")}"
  availability_zone = "ap-southeast-2a"

  lifecycle {
    ignore_changes = ["user_data"]
  } 
  tags {
    Name = "bastion-vpc-i"
  }
}

resource "aws_instance" "ec2-vpc-i" {
  ami  = "${var.ami}"
  instance_type = "t1.micro"
  key_name = "${aws_key_pair.default.id}"
  subnet_id = "${aws_subnet.private-subnet-vpc-i.id}"
  vpc_security_group_ids = ["${aws_security_group.default-sg-vpc-i.id}"]
  
  source_dest_check = false
  user_data = "${file("install.sh")}"
  availability_zone = "ap-southeast-2a"

  lifecycle {
    ignore_changes = ["user_data"]
  } 
  tags {
    Name = "ec2-vpc-i"
  }
}

resource "aws_instance" "ec2-vpc-ni" {
  ami  = "${var.ami}"
  instance_type = "t1.micro"
  key_name = "${aws_key_pair.default.id}"
  subnet_id = "${aws_subnet.private-subnet-vpc-ni.id}"
  vpc_security_group_ids = ["${aws_security_group.no-internet-sg.id}"]
  
  source_dest_check = false
  user_data = "${file("install.sh")}"
  availability_zone = "ap-southeast-2a"

  lifecycle {
    ignore_changes = ["user_data"]
  } 
  tags {
    Name = "ec2-vpc-ni"
  }
}

