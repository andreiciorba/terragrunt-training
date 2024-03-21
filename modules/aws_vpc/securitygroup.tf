resource "aws_security_group" "tf_sec_group" {
  name   = "${var.environment}-default-SG"
  vpc_id = aws_vpc.tfvpc.id

  depends_on = [
    aws_vpc.tfvpc
  ]

  tags = {
    "Name" = "${var.environment}-default-SG"
  }
}

resource "aws_security_group_rule" "tf_sec_group_rule_in_22" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf_sec_group.id
}

resource "aws_security_group_rule" "tf_sec_group_rule_in_80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf_sec_group.id
}

resource "aws_security_group_rule" "tf_sec_group_rule_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf_sec_group.id
}