output "blockscout_instance_id" {
  value = aws_instance.blockscout_instance.id
  description = "ID of the blockscout instance"
}

output "blockscout_alb_dns" {
  value = aws_lb.polygon-blockscout.dns_name
  description = "DNS name of Blockscout ALB"
}