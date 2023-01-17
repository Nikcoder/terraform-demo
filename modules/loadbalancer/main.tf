resource "aws_lb" "app_load_balancer" {
  name               = "Applicationload"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_id]
  subnets            = [var.subnet_id, var.pub_subnet_id]

  enable_deletion_protection = false

  tags = {
    Name = "var.alb_name"
  }
}

resource "aws_lb_target_group" "Target_group" {
   name               = "TG"
   target_type        = "instance"
   port               = 80
   protocol           = "HTTP"
   vpc_id             = var.vpc_id
   health_check {
      healthy_threshold   = 5
      interval            = 300
      unhealthy_threshold = 2
      timeout             = 60
      path                = "/"
      matcher             = 200 
  }
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.Target_group.arn
  target_id        = var.instance_id
  port             = 80
}
