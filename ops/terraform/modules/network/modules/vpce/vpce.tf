resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.private_route_table_ids
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id              = var.vpc_id
  private_dns_enabled = true
  service_name        = "com.amazonaws.${var.aws_region}.logs"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpce.id]
  subnet_ids          = var.private_subnet_ids
}

resource "aws_vpc_endpoint" "ecr_dkr_endpoint" {
  vpc_id              = var.vpc_id
  private_dns_enabled = true
  service_name        = "com.amazonaws.${var.aws_region}.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpce.id]
  subnet_ids          = var.private_subnet_ids
}

resource "aws_vpc_endpoint" "ecr_api_endpoint" {
  vpc_id              = var.vpc_id
  private_dns_enabled = true
  service_name        = "com.amazonaws.${var.aws_region}.ecr.api"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpce.id]
  subnet_ids          = var.private_subnet_ids
}