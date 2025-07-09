output "public_subnet_ids" {
  value = aws_subnet.main-pub-subnet[*].id  
}
