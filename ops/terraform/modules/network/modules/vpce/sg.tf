resource "aws_security_group" "vpce" {
  name        = format("%s-vpce-sg", var.vpc_name)
  description = format("Security group for VPC endpoint in %s", var.vpc_name)
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443 # HTTPS
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  tags = {
    Name = format("%s-vpce-sg", var.vpc_name)
  }
}
