output "alb_dns_name" {
  value = aws_lb.main-web_alb.dns_name
}

output "alb_arn" {
  value = aws_lb.main-web_alb.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.main-web_tg.arn
}
