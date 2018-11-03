resource "aws_vpc" "vpc-no-internet" {
  cidr_block = "10.0.0.0/21"

  tags {
    Name = "viet-vpc-no-internet"
  }
}

resource "aws_vpc" "vpc-with-internet" {
  cidr_block = "10.0.8.0/21"

  tags {
    Name = "viet-vpc-with-internet"
  }
}