module "vpc" {
  source = "./modules/vpc"

  namespaced_department_name = var.namespaced_department_name
  network                    = var.network
}

module "vpce" {
  count = var.create_vpc_endpoint ? 1 : 0

  depends_on = [module.vpc]

  source = "./modules/vpce"

  private_subnet_ids      = module.vpc.subnets.private.id
  vpc_name                = format("%s-vpce", var.namespaced_department_name)
  vpc_id                  = module.vpc.vpc_config.id
  private_route_table_ids = module.vpc.route_tables.private.id
  cidr_block              = module.vpc.vpc_config.cidr_block
  aws_region              = var.aws_region
}
