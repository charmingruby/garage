locals {
  common_tags = {
    department   = "SRE Engineering"
    created_at   = "2024-12-31"
    managed_by   = "Terraform"
    owner        = "Gustavo Dias"
    environment  = var.environment
    service_name = "garage"
  }
}
