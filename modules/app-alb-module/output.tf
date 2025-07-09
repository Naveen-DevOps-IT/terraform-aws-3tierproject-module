output "app_alb_dns_name" {
  value = aws_lb.main-app_alb.dns_name
}

output "app_alb_arn" {
  value = aws_lb.main-app_alb.arn
}

output "app_target_group_arn" {
  value = aws_lb_target_group.main-app_tg.arn
}
