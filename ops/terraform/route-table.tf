resource "aws_route_table" "public-subnet-rt" {
  vpc_id = "${aws_vpc.vpc-with-internet.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet-gateway.id}"
  }

  tags {
    Name = "Public Subnet RT"
  }
}

resource "aws_route_table_association" "public-subnet-rt" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.public-subnet-rt.id}"
}

resource "aws_route_table" "private-subnet-rt" {
  vpc_id = "${aws_vpc.vpc-with-internet.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat.id}"
  }

  tags {
    Name = "Private Subnet Route Table"
  }
}

resource "aws_route_table_association" "private-subnet-rt" {
  subnet_id = "${aws_subnet.viet-private-subnet.id}"
  route_table_id = "${aws_route_table.private-subnet-rt.id}"
}