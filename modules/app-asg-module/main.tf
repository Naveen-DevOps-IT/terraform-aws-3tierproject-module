resource "aws_launch_template" "main-app_lt" {
  name_prefix   = var.lt_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = base64encode(<<EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "App Tier - Served from $(hostname)" > /var/www/html/index.html
EOF
  )

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.app_sg_id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "app-tier-instance"
    }
  }
}

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.private_subnet_ids
  target_group_arns    = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.main-app_lt.id
    version = "$Latest"
  }

  health_check_type         = "EC2"
  health_check_grace_period = 30

  tag {
    key                 = "Name"
    value               = "app-asg-instance"
    propagate_at_launch = true
  }
}
