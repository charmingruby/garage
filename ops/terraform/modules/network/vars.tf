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

variable "use_nat_gateway" {
  description = "Whether to use NAT Gateway to connect the private subnet(s) to the internet or not. Conflicts with use_nat_instance. Setting both to true is not allowed. Choose one based on the cost and performance needs of your environment"
  type        = bool
}

variable "use_nat_instance" {
  description = "Whether to use NAT Instances to connect the private subnet(s) to the internet or not. Conflicts with use_nat_gateway. Setting both to true is not allowed. Choose one based on the cost and performance needs of your environment"
  type        = bool
}

variable "create_vpc_endpoint" {
  description = "Controls the creation of VPC Endpoints for services like S3, Docker, and Cloudwatch. Requires network.enable_dns_support and network.enable_dns_hostnames to be true. Ensuring these prerequisites can enable private access to AWS services without requiring Internet Gateway"
  type        = bool
}

variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
}
