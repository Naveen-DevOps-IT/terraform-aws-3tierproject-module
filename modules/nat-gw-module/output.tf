output "nat_gateway_id" {
  value = aws_nat_gateway.main-nat-gw.id
}

output "eip_id" {
  value = aws_eip.main-eip.id
}
