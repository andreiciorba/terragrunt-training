resource "aws_route_table" "tf_public_rt" {
  vpc_id = aws_vpc.tfvpc.id

  tags = {
    "Name" = "${var.environment}-public-rt"
  }
}

resource "aws_route_table" "tf_private_rt" {
  vpc_id = aws_vpc.tfvpc.id

  tags = {
    "Name" = "${var.environment}-private-rt"
  }
}


resource "aws_route" "tf_route_to_igw" {
  route_table_id         = aws_route_table.tf_public_rt.id
  gateway_id             = aws_internet_gateway.tfigw.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on = [
    aws_internet_gateway.tfigw
  ]
}


resource "aws_route" "tf_route_to_natgw" {
  route_table_id         = aws_route_table.tf_private_rt.id
  gateway_id             = aws_nat_gateway.tfnatgw.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on = [
    aws_nat_gateway.tfnatgw
  ]
}

resource "aws_route_table_association" "public_association" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.tf_public_rt.id
}


resource "aws_route_table_association" "private_association" {
  count          = length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.tf_private_rt.id
}