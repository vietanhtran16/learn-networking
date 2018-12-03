resource "aws_vpc" "vpc-no-internet" {
  cidr_block = "${var.no_internet_vpc_cidr}"
  enable_dns_hostnames = false
  enable_dns_support = true

  tags {
    Name = "viet-vpc-no-internet"
  }
}

resource "aws_subnet" "private-subnet-vpc-ni" {
  vpc_id     = "${aws_vpc.vpc-no-internet.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-southeast-2a"

  tags {
    Name = "private-subnet-vpc-ni"
  }
}