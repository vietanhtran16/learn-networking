resource "aws_vpc" "vpc-with-internet" {
  cidr_block = "10.0.8.0/21"

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

resource "aws_subnet" "viet-with-internet-subnet" {
  vpc_id     = "${aws_vpc.vpc-with-internet.id}"
  cidr_block = "10.0.8.0/24"
  map_public_ip_on_launch = true

  tags {
    Name = "viet-with-internet-subnet"
  }
}