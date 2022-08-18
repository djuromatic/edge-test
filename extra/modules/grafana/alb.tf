// Create new ALB
resource "aws_lb" "polygon-grafana" {
  name               = var.grafana_alb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = [for subnet in var.public_subnets : subnet.id]
  security_groups = [var.grafana_alb_sec_group]


  tags = {
    Name = var.grafana_alb_name_tag
  }
}
// Create new ALB Target Group
resource "aws_lb_target_group" "polygon-blockscout" {
  name     = var.grafana_alb_targetgroup_name
  port     = var.grafana_alb_targetgroup_port
  protocol = var.grafana_alb_targetgroup_proto
  vpc_id   = var.vpc_id
}

// Set listener on ALB
resource "aws_lb_listener" "polygon-blockscout" {
  load_balancer_arn = aws_lb.polygon-grafana.arn
  port              = var.grafana_alb_listen_port
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn = data.aws_acm_certificate.grafana_edgenet.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.polygon-blockscout.arn
  }
}

// Attach instances to ALB
resource "aws_lb_target_group_attachment" "polygon-nodes" {
  target_group_arn = aws_lb_target_group.polygon-blockscout.arn
  target_id        = aws_instance.grafana_instance.id
  port             = var.grafana_alb_targetgroup_port
}
