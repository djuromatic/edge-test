output "jsonrpc_dns_name" {
  value       = module.alb.dns_name
  description = "The dns name for the JSON-RPC API"
}

output "bastion_instance_public_ip" {
  value       = module.bastion_instance.bastion_eip
  description = "The public ip address of the bastion instance"
}

output "nodes_private_ip" {
  value       = module.instances[*].private_ip
  description = "Internal ip addresses of the nodes that can be accessed via Bastion"
}

output "internal_sec_group" {
  value       = module.security.internal_sec_group_id
  description = "Internal security group id. Needed for building Blockscout with Packer."
}

output "private_subnet_id" {
  value       = module.vpc.internal_subnets[0].id
  description = "Private subnet id. Needed for building Blockscout with Packer."
}

# output "database_endpoint" {
#   value       = module.rds[0].database_dns
#   description = "Database connection endpoint"
# }

# output "blockscout_alb_dns" {
#   value       = module.blockscout[0].blockscout_alb_dns
#   description = "Blockscout ALB DNS name"
# }

# output "grafana_alb_dns" {
#   value = module.grafana[0].grafana_alb_dns
#   description = "Grafana ALB DNS name"
# }
