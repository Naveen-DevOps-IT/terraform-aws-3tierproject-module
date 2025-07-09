resource "aws_subnet" "main-pvt-subnet" {
  count                   = length(var.pvtsubnet-cidr) # 4 private subnets
  vpc_id                  = var.vpc_id
  availability_zone       = var.pvtsubnet-az[count.index]
  map_public_ip_on_launch = false # Private subnets do not map public IPs
  cidr_block              = var.pvtsubnet-cidr[count.index]

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}
