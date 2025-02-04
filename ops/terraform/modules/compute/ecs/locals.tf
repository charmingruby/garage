locals {
  namespaced_department_name = "${var.department_name}-${var.environment}"
  namespaced_service_name    = "${var.service_name}-${var.environment}"
  account_id                 = data.aws_caller_identity.current.account_id

  # ECS
  container_name          = "${local.namespaced_service_name}-container"
  app_image               = var.ecs.app_image != "" ? var.ecs.app_image : "${data.terraform_remote_state.ecr.outputs.repository_url}:${data.terraform_remote_state.ecr.outputs.version}"
  autoscaling_resource_id = "service/${aws_ecs_cluster.this.name}/${aws_ecs_service.this.name}"

  # Network
  vpc     = data.terraform_remote_state.network.outputs.vpc
  subnets = data.terraform_remote_state.network.outputs.subnets

  # Database
  db_host = data.terraform_remote_state.db.outputs.database_endpoint
  db_name = data.terraform_remote_state.db.outputs.database_name
  db_user = data.terraform_remote_state.db.outputs.database_username
  db_port = data.terraform_remote_state.db.outputs.database_port
  db_pass = jsondecode(data.aws_secretsmanager_secret_version.rds_password.secret_string)["password"]

  # Domain
  is_prod_env                          = var.environment == "prod"
  has_domain_name                      = var.domain_name != null
  create_resource_based_on_domain_name = local.has_domain_name ? 1 : 0
  subdomain_name                       = local.has_domain_name ? "${local.is_prod_env ? "" : "${var.environment}."}fargate.${var.domain_name}" : ""

  common_tags = {
    Project   = "Garage"
    Component = "ECS Fargate"
    CreatedAt = "2024-07-05"
    ManagedBy = "Terraform"
    Owner     = "Gustavo Dias"
    Env       = var.environment
  }
}
