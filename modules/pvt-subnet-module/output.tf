output "private_subnet_ids" {
  value = aws_subnet.main-pvt-subnet[*].id
}