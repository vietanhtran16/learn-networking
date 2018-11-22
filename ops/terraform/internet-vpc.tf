resource "aws_vpc" "vpc-with-internet" {
  cidr_block = "${var.internet_vpc_cidr}"
  enable_dns_hostnames = false
  enable_dns_support = true

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
  availability_zone = "ap-southeast-2a"

  tags {
    Name = "public-subnet"
  }
}

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

resource "aws_route_table_association" "web-public-rt" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.public-subnet-rt.id}"
}