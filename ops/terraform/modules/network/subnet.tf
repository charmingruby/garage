resource "aws_subnet" "private" {
  count = var.network.az_count

  cidr_block        = cidrsubnet(var.network.cidr_block, 8, count.index)
  availability_zone = local.selected_availability_zones[count.index]
  vpc_id            = aws_vpc.this.id

  tags = {
    Name = format("%s-private-%s", var.namespaced_department_name, local.selected_availability_zones[count.index])
  }
}

resource "aws_subnet" "public" {
  count = var.network.az_count

  cidr_block        = cidrsubnet(var.network.cidr_block, 8, var.network.az_count + count.index)
  availability_zone = local.selected_availability_zones[count.index]
  vpc_id            = aws_vpc.this.id

  tags = {
    Name = format("%s-public-%s", var.namespaced_department_name, local.selected_availability_zones[count.index])
  }
}

resource "aws_route" "internet_access" {
  gateway_id             = aws_internet_gateway.this.id
  route_table_id         = aws_vpc.this.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table" "public" {
  count = var.network.az_count

  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = format("%s-public-route-%s", var.namespaced_department_name, local.selected_availability_zones[count.index])
  }
}

resource "aws_route_table" "private" {
  count = var.network.az_count

  vpc_id = aws_vpc.this.id

  tags = {
    Name = format("%s-private-route-%s", var.namespaced_department_name, local.selected_availability_zones[count.index])
  }
}

resource "aws_route_table_association" "public" {
  count = var.network.az_count

  route_table_id = aws_route_table.public.*.id[count.index]
  subnet_id      = aws_subnet.public.*.id[count.index]
}

resource "aws_route_table_association" "private" {
  count = var.network.az_count

  route_table_id = aws_route_table.private.*.id[count.index]
  subnet_id      = aws_subnet.private.*.id[count.index]
}
