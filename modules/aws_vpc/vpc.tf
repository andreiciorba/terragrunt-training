resource "aws_vpc" "tfvpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    "Name" = "${var.environment}-VPC"
  }
}