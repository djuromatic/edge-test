data "aws_acm_certificate" "rpc_edgenet" {
  domain   = var.alb_certificate
  statuses = ["ISSUED"]
  most_recent = true
}