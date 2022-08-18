variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "internal_sec_gr_name_tag" {
  default = "Polygon Edge Internal Sec Group TestNet"
  type = string
  description = "Internal security group name tag"
}

variable "bastion_sec_gr_name_tag" {
  type = string
  description = "Bastion security group name tag"
  default = "Polygon Edge Bastion Sec Group TestNet"
}

variable "ssh_key_name" {
  type = string
  description = "The name of the SSH public key"
}

variable "ssh_public_key" {
  type = string
  description = "The SSH public key value"
}

variable "admin_public_ip" {
  type = string
  description = "The admin public ip address that will be used to access the Bastion instance. Must be in CIDR format!"
} 

variable "region" {
  type = string
  description = "The region in which instances reside. Default: us-west-2"
  default = "us-west-2"
}

variable "account_id" {
  type = string
  description = "The AWS account ID"
}

variable "alb_sec_gr_name_tag" {
  type = string
  description = "The name tag for ALB security group"
  default = "Polygon Edge JSON-RPC ALB Sec Group TestNet"
}

variable "db_sec_gr_name_tag" {
  type = string
  description = "The name tag for DB security group"
  default = "Polygon Edge DB Sec Group TestNet"
}

variable "blockscout_alb_sec_gr_name_tag" {
  type = string
  description = "The name tag for Blockscout ALB security group"
  default = "Polygon Edge Blockscout ALB TestNet"
}
variable "blockscout_sec_gr_name_tag" {
  type = string
  description = "The name tag for Blockscout instance security group"
  default = "Polygon Edge Blockscout instance TestNet"
}

variable "grafana_alb_sec_gr_name_tag" {
  type = string
  description = "The name tag for Grafana ALB security group"
  default = "Polygon Edge Grafana ALB TestNet"
}
variable "grafana_sec_gr_name_tag" {
  type = string
  description = "The name tag for Grafana instance security group"
  default = "Polygon Edge Grafana instance TestNet"
}

variable "s3_bucket_name" {
  type = string
  description = "The name for the S3 bucket that will hold genesis.json file"
}

variable "ssm_id" {
  type = string
  description = "The ID for SSM to store parameters"
}