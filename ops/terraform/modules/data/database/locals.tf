locals {
  namespaced_service_name = "${var.service_name}-${var.environment}"

  # Network
  vpc                = data.terraform_remote_state.network.outputs.vpc
  subnets            = data.terraform_remote_state.network.outputs.subnets
  availability_zones = sort(data.aws_availability_zones.all.names)

  bastion_host_sg_id = lookup(data.terraform_remote_state.bastion_host.outputs, "security_group_id", "")

  common_tags = {
    Project   = "Garage"
    Component = "Database"
    CreatedAt = "2024-07-03"
    ManagedBy = "Terraform"
    Owner     = "Gustavo Dias"
    Env       = var.environment
  }
}
