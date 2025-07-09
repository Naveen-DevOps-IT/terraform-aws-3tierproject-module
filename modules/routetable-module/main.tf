resource "aws_route_table" "main-rt" {
  count  = length(var.rt-name)
  vpc_id = var.vpc_id

  tags = {
    Name = var.rt-name[count.index]
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id     = count.index == 0 ? var.igw_id : null
    nat_gateway_id = count.index == 1 ? var.nat_gw_id : null
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.main-rt[0].id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.main-rt[1].id
}
