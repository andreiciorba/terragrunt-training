resource "aws_nat_gateway" "tfnatgw" {
  subnet_id     = aws_subnet.public_subnets[0].id
  allocation_id = aws_eip.tfeip.id
  depends_on = [
    aws_subnet.public_subnets,
    aws_eip.tfeip
  ]

  tags = {
    "Name" = "${var.environment}-NATGW"
  }
}