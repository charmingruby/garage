# module "data" {
#   source = "./modules/data"
# }

module "network" {
  source = "./modules/network"

  namespaced_department_name = local.namespaced_department_name
  network                    = var.network
  use_nat_gateway            = var.use_nat_gateway
  use_nat_instance           = var.use_nat_instance
  create_vpc_endpoint        = var.create_vpc_endpoint
  aws_region                 = var.aws_region
}
