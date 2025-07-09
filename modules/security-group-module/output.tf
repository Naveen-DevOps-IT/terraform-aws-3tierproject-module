output "web_sg_id" {
  value = aws_security_group.main-web_sg.id
}

output "app_sg_id" {
  value = aws_security_group.main-app_sg.id
}

output "db_sg_id" {
  value = aws_security_group.main-db_sg.id
}

output "security_group_ids" {
  value = [
    aws_security_group.main-web_sg.id,
    aws_security_group.main-app_sg.id,
    aws_security_group.main-db_sg.id
  ]
}