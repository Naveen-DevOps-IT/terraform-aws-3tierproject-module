resource "aws_eip" "main-eip" {
  domain = "vpc"
  tags = {
    Name = var.eip-name
  }
}

resource "aws_nat_gateway" "main-nat-gw" {
  allocation_id = aws_eip.main-eip.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = var.nat-gw-name
  }
}
