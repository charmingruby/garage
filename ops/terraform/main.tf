module "data" {
  source = "./modules/data"
}

module "network" {
  source = "./modules/network"

  namespaced_department_name = local.namespaced_department_name
}
