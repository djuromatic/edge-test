output "grafana_alb_dns" {
  value = aws_lb.polygon-grafana.dns_name
  description = "Grafana ALB DNS name"
}