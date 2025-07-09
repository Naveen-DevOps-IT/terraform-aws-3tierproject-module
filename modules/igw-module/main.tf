resource "aws_internet_gateway" "main-igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.igw-name
  }
}
