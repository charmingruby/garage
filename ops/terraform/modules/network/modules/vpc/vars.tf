variable "namespaced_department_name" {
  description = "The department name to namespace the resources"
  type        = string
}


variable "network" {
  description = <<-EOT
                General configuration for the network, including:
                  - az_count: Number of availability zones to use.
                  - cidr_block: IPv4 CIDR block for the VPC, e.g., '10.1.0.0/16'.
                  - enable_dns_support: Whether to enable DNS support (true or false).
                  - enable_dns_hostnames: Whether to enable DNS hostnames (true or false).
                EOT

  type = object({
    az_count             = number
    cidr_block           = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
  })
}
