locals {
  use_nat_gateway      = var.use_nat_gateway
  use_nat_instance     = var.use_nat_instance && local.use_nat_gateway == false
  enable_dns_support   = (var.use_nat_instance || var.create_vpc_endpoint) ? true : var.network.enable_dns_support
  enable_dns_hostnames = (var.use_nat_instance || var.create_vpc_endpoint) ? true : var.network.enable_dns_hostnames


  common_tags = {
    department   = "SRE Engineering"
    created_at   = "2024-12-31"
    managed_by   = "Terraform"
    owner        = "Gustavo Dias"
    environment  = var.environment
    service_name = "garage"
  }

  namespaced_department_name = format("%s-%s", local.common_tags["department"], var.environment)
}
