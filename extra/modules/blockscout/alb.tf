// Create new ALB
resource "aws_lb" "polygon-blockscout" {
  name               = var.blockscout_alb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = [for subnet in var.public_subnets : subnet.id]
  security_groups = [var.blockscout_alb_sec_group]


  tags = {
    Name = var.blockscout_alb_name_tag
  }
}
// Create new ALB Target Group
resource "aws_lb_target_group" "polygon-blockscout" {
  name     = var.blockscout_alb_targetgroup_name
  port     = var.blockscout_alb_targetgroup_port
  protocol = var.blockscout_alb_targetgroup_proto
  vpc_id   = var.vpc_id
}

// Set listener on ALB
resource "aws_lb_listener" "polygon-blockscout" {
  load_balancer_arn = aws_lb.polygon-blockscout.arn
  port              = var.blockscout_alb_listener_port
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn = data.aws_acm_certificate.Blockscout_EdgeNet-testnet.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.polygon-blockscout.arn
  }
}

// Attach instances to ALB
resource "aws_lb_target_group_attachment" "polygon-nodes" {
  target_group_arn = aws_lb_target_group.polygon-blockscout.arn
  target_id        = aws_instance.blockscout_instance.id
  port             = var.blockscout_alb_targetgroup_port
}
