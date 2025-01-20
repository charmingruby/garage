module "remote_state" {
  source = "./modules/remote_state"

  namespaced_department_name = local.namespaced_department_name
  aws_region                 = var.aws_region
}
