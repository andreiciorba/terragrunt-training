resource "aws_internet_gateway" "tfigw" {
  vpc_id = aws_vpc.tfvpc.id

  tags = {
    "Name" = "${var.environment}-IGW"
  }
}