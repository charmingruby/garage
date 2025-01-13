module "aws_data" {
  source = "./modules/aws/data"

  service_name = local.common_tags.service_name
}
