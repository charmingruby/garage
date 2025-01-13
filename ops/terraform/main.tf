module "data" {
  source = "./modules/data"

  service_name = local.common_tags.service_name
}
