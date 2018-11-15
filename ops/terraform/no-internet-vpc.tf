resource "aws_vpc" "vpc-no-internet" {
  cidr_block = "${var.no_internet_vpc_cidr}"

  tags {
    Name = "viet-vpc-no-internet"
  }
}

resource "aws_subnet" "viet-no-internet-subnet" {
  vpc_id     = "${aws_vpc.vpc-no-internet.id}"
  cidr_block = "10.0.0.0/24"

  tags {
    Name = "viet-no-internet-subnet"
  }
}
