#use terraform output cmd, it shows output defined in root output.tf file

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.public_subnet.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.private_subnet.private_subnet_ids
  
}

output "igw_id" {
  value = module.igw.igw_id
}

output "nat_gateway_id" {
  value = module.nat_gateway.nat_gateway_id
}

output "eip_id" {
  value = module.nat_gateway.eip_id
}


output "route_table_ids" {
  value = module.route_table.route_table_ids
}

output "security_group_ids" {
  value = module.security_groups.security_group_ids
}

output "alb_dns_name" {
  value = module.web_alb.alb_dns_name
}

output "alb_target_group_arn" {
  value = module.web_alb.target_group_arn
}

output "alb_arn" {
  value = module.web_alb.alb_arn
}

output "app_alb_dns_name" {
  value = module.app_alb.app_alb_dns_name
}

output "app_alb_arn" {
  value = module.app_alb.app_alb_arn
}

output "app_target_group_arn" {
  value = module.app_alb.app_target_group_arn
}   

output "db_endpoint" {
  value = module.rds_mysql.db_endpoint
}

output "db_identifier" {
  value = module.rds_mysql.db_identifier
}
