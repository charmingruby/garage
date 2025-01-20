output "subnets" {
  value = module.network.subnets
}

output "route_tables" {
  value = module.network.route_tables
}

output "az_count" {
  value = module.network.az_count
}

output "selected_availability_zones" {
  value = module.network.selected_availability_zones
}

output "vpc" {
  value = module.network.vpc_config
}
