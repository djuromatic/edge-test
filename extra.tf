# module "rds" {
#   count = var.extra_features == true ? 1 : 0

#   source                      = "./extra/modules/database"
#   database_master_pass        = var.database_master_pass
#   database_master_username    = var.database_master_username
#   database_security_group_ids = [module.security.db_sec_group_id]
#   database_subnet_ids         = module.vpc.db_subnets.*.id
# }

# module "blockscout" {
#   count = (var.extra_features == true) && (var.blockscout_ami_name_tag != "") ? 1 : 0

#   source                        = "./extra/modules/blockscout"
#   subnet_id                     = module.vpc.internal_subnets[3].id
#   key_name                      = var.ssh_key_name
#   blockscout_ami_name_tag       = var.blockscout_ami_name_tag
#   public_subnets                = module.vpc.external_subnets
#   vpc_id                        = module.vpc.vpc_id
#   blockscout_certificate        = var.blockscout_alb_certificate
#   blockscout_alb_sec_group      = module.security.blockscout_alb_sec_group_id
#   blockscout_instance_sec_group = module.security.blockscout_instance_sec_group_id

# }

# module "grafana" {
#   count = (var.extra_features == true) && (var.grafana_ip != "") ? 1 : 0

#   source                = "./extra/modules/grafana"
#   subnet_id             = module.vpc.internal_subnets[2].id
#   grafana_sec_groups    = [module.security.grafana_instance_sec_group_id]
#   grafana_ip            = var.grafana_ip
#   key_name              = var.ssh_key_name
#   grafana_alb_sec_group = module.security.grafana_alb_sec_group_id
#   grafana_certificate   = var.grafana_alb_certificate
#   vpc_id                = module.vpc.vpc_id
#   public_subnets        = module.vpc.external_subnets
# }
