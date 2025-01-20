module "vpce" {
  count = var.create_vpc_endpoint ? 1 : 0

  source = "./modules/vpce"


  private_subnet_ids         = aws_subnet.private.*.id
  vpc_name                   = format("%s-vpce", var.namespaced_department_name)
  private_route_table_ids    = aws_route_table.private.*.id
  cidr_block                 = aws_vpc.this.cidr_block
  aws_region                 = var.aws_region
  namespaced_department_name = var.namespaced_department_name
  vpc_id                     = aws_vpc.this.id
}
