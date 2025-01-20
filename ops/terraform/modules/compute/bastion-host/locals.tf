locals {
  namespaced_service_name = "${var.service_name}-${var.environment}"

  # Network
  vpc     = data.terraform_remote_state.network.outputs.vpc
  subnets = data.terraform_remote_state.network.outputs.subnets

  common_tags = {
    Project   = "Garage"
    Component = "Bastion Host"
    CreatedAt = "2024-07-03"
    ManagedBy = "Terraform"
    Owner     = "Gustavo Dias"
    Env       = var.environment
  }
}
