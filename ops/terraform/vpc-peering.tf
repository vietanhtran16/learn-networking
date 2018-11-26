resource "aws_vpc_peering_connection" "vpc-peering" {
  vpc_id      = "${aws_vpc.vpc-with-internet.id}"
  peer_vpc_id = "${aws_vpc.vpc-no-internet.id}"
  auto_accept = true
}
