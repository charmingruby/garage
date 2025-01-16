resource "aws_vpc" "this" {
  cidr_block           = var.network.cidr_block
  enable_dns_hostnames = var.network.enable_dns_hostnames
  enable_dns_support   = var.network.enable_dns_hostnames

  tags = {
    Name = format("%s-vpc", var.namespaced_department_name)
  }
}


resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = format("%s-igw", var.namespaced_department_name)
  }
}
