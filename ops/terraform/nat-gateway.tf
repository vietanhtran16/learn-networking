resource "aws_eip" "nat_gateway" {
  vpc      = true
  depends_on = ["aws_internet_gateway.internet-gateway"]
}

resource "aws_nat_gateway" "nat" {
    allocation_id = "${aws_eip.nat_gateway.id}"
    subnet_id = "${aws_subnet.public-subnet.id}"
    depends_on = ["aws_internet_gateway.internet-gateway"]
}