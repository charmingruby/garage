output "subnets" {
  value = {
    private = {
      id          = aws_subnet.private[*].id,
      cidr_blocks = aws_subnet.private[*].cidr_block,
    },
    public = {
      id          = aws_subnet.private[*].id,
      cidr_blocks = aws_subnet.private[*].cidr_block,
    },
  }
}

output "route_tables" {
  value = {
    private = {
      id = aws_route_table.private[*].id,
    },
    public = {
      id = aws_route_table.public[*].id,
    },
  }
}

output "az_count" {
  value = var.network.az_count
}

output "selected_availability_zones" {
  value = local.selected_availability_zones
}

output "vpc_config" {
  value = {
    id         = aws_vpc.this.id,
    cidr_block = aws_vpc.this.cidr_block,
  }
}
