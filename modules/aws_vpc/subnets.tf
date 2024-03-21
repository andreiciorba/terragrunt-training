resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.tfvpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.azs[count.index]

  tags = {
    "Name" = "${var.environment}-publicsubnet-${var.azs[count.index]}"
  }
}


resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.tfvpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    "Name" = "${var.environment}-privatesubnet-${var.azs[count.index]}"
  }
}