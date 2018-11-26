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

resource "aws_subnet" "viet-private-subnet" {
  vpc_id     = "${aws_vpc.vpc-with-internet.id}"
  cidr_block = "10.0.10.0/24"
  availability_zone = "ap-southeast-2a"

  tags {
    Name = "viet-private-subnet"
  }
}