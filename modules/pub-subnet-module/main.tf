resource "aws_subnet" "main-pub-subnet" {
  count = length(var.pubsubnet-cidr)  # Creating 2 public subnets 
  vpc_id            = var.vpc_id
  availability_zone = var.pubsubnet-az[count.index]
  map_public_ip_on_launch = true  
  cidr_block     = var.pubsubnet-cidr[count.index]
   tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}
