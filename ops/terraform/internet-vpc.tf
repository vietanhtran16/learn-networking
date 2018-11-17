resource "aws_vpc" "vpc-with-internet" {
  cidr_block = "${var.internet_vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "viet-vpc-with-internet"
  }
}

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = "${aws_vpc.vpc-with-internet.id}"

  tags {
    Name = "viet-internet-gateway"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = "${aws_vpc.vpc-with-internet.id}"
  cidr_block = "10.0.8.0/24"
  map_public_ip_on_launch = true

  tags {
    Name = "public-subnet"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.vpc-with-internet.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internet-gateway.id}"
}

resource "aws_route_table_association" "route-table-association" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.public-subnet-route-table.id}"
}