resource "aws_eip" "tfeip" {
  domain = "vpc"

  tags = {
    "Name" = "${var.environment}-EIP"
  }
}