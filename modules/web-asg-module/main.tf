resource "aws_launch_template" "main-web_lt" {
  name_prefix   = var.lt_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = filebase64("${path.module}/webdeploy.sh")
  

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.web_sg_id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "web-tier-instance"
    }
  }
  lifecycle {
    prevent_destroy = false  # give it true to prevent accidental deletion
    # This will ignore changes to the template, useful if you want to update the template outside terraform
    ignore_changes = all
  }
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.public_subnet_ids
  target_group_arns    = [var.target_group_arn]
  launch_template {
    id      = aws_launch_template.main-web_lt.id
    version = "$Latest"
  }

  health_check_type         = "EC2"
  health_check_grace_period = 30

  tag {
    key                 = "Name"
    value               = "web-asg-instance"
    propagate_at_launch = true
  }
}
