output "subnets" {
  value = module.vpc.subnets
}

output "route_tables" {
  value = module.vpc.route_tables
}

output "az_count" {
  value = module.vpc.az_count
}

output "selected_availability_zones" {
  value = module.vpc.selected_availability_zones
}

output "vpc_config" {
  value = module.vpc.vpc_config
}
