resource "aws_lb" "main-app_alb" {
  name               = var.app_alb_name
  internal           = true  #Key difference from Web ALB
  load_balancer_type = "application"
  security_groups    = [var.app_sg_id]
  subnets            = var.private_subnet_ids

  tags = {
    Name = var.app_alb_name
  }
}

resource "aws_lb_target_group" "main-app_tg" {
  name     = var.app_target_group_name
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path     = "/"
    protocol = "HTTP"
    matcher  = "200-399"
  }

  tags = {
    Name = var.app_target_group_name
  }
}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.main-app_alb.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main-app_tg.arn
  }
}
