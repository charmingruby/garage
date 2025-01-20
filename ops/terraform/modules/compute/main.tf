module "bastion_host" {
  source = "./modules/bastion_host"

  allowed_ip                 = var.allowed_ip
  aws_region                 = var.aws_region
  environment                = var.environment
  namespaced_department_name = var.namespaced_department_name
  instance_type              = var.instance_type
  key_name                   = var.key_name
}
