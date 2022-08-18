variable "database_subnet_ids" {
  type = list(string)
  description = "A list of at least two subnet ids for database"
}
variable "database_master_username" {
  type = string
  description = "Master username for database"
}
variable "database_master_pass" {
  type = string
  description = "Password for master username"
}
variable "database_security_group_ids" {
  type = list(string)
  description = "List of security groups to put the database in"
}
variable "database_subgroup_name" {
  type = string
  description = "Database subnet group name"
  default = "polygonedge-blockscout-subgroup-testnet"
}
variable "database_subnet_group_name_tag" {
  type = string
  description = "Name Tag for database subnet group"
  default = "PolygonEdge databases subnet groups Testnet"
}
variable "database_name_tag" {
  type = string
  description = "Name Tag for database instance"
  default = "PolygonEdge-DB-testnet"
}
variable "database_instance_type" {
  type = string
  description = "Type of DB instance"
  default = "db.t3.large"
}
variable "database_apply_immediately" {
  type = bool
  description = "Apply the changes immediately or wait for maintenance window. Default: true"
  default = true
}
variable "database_skip_final_snapshot" {
  type = bool
  description = "Skip creating the final snapshot on destroying the instance"
  default = true
}

variable "multi_az" {
  type  = bool
  description = "Setup a multi az database cluster"
  default = true
}

variable "db_storage_capacity" {
  type  = number
  description = "The storage capacity for the database"
  default = 30
}