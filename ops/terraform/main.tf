module "network" {
  source = "./modules/network"

  namespaced_department_name = local.namespaced_department_name
  network                    = var.network
  use_nat_gateway            = var.use_nat_gateway
  use_nat_instance           = var.use_nat_instance
  create_vpc_endpoint        = var.create_vpc_endpoint
  aws_region                 = var.aws_region
}

module "compute" {
  depends_on = [module.network]

  source = "./modules/compute"

  namespaced_department_name = local.namespaced_department_name
  environment                = var.environment
  aws_region                 = var.aws_region
  allowed_ip                 = var.allowed_ip
  key_name                   = var.key_name
  instance_type              = var.instance_type
}
