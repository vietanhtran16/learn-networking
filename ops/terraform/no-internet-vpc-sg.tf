resource "aws_security_group" "private-subnet-sg"{
  name = "private-subnet-sg"
  description = "Allow traffic from public subnet"

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${var.internet_vpc_cidr}"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.internet_vpc_cidr}"]
  }

  vpc_id = "${aws_vpc.vpc-no-internet.id}"

  tags {
    Name = "private-subnet-sg"
  }
}