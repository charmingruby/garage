locals {
  namespaced_department_name = "${var.department_name}-${var.environment}"
  namespaced_service_name    = "${var.service_name}-${var.environment}"
  service_file_hash          = sha1(join("", [for file in fileset("${var.app_folder}/src", "**") : filesha1("${var.app_folder}/src/${file}")]))

  account_id = data.aws_caller_identity.current.account_id

  common_tags = {
    Project   = "Garage"
    Component = "ECR"
    CreatedAt = "2024-07-05"
    ManagedBy = "Terraform"
    Owner     = "Gustavo Dias"
    Env       = var.environment
  }
}
