// user defined
variable "ssh_key_name" {}               //declared locally in terraform.tfvars
variable "ssh_public_key" {}             //declared locally in terraform.tfvars
variable "admin_ip" {}                   //declared locally in terraform.tfvars
variable "account_id" {}                 //declared locally in terraform.tfvars
variable "premine" {}                    //declared locally in terraform.tf
variable "nodes_alb_certificate" {}      // declared locally in terraform.tf
variable "blockscout_alb_certificate" {} // declared locally in terraform.tf
variable "grafana_alb_certificate" {}    // declared locally in terraform.tf
variable "s3_bucket_name" {
  type = string
  description = "The name for S3 bucket"
  default = "edge-nodes"
}
variable "ssm_id" {
  type = string
  description = "The ID for SSM parameters"
  default = "polygon-edge-validators-testnet"
}

### EXTRA FEATURES ####
// enable extra features
variable "extra_features" {
  type        = bool
  default     = true
  description = "Enable extra features - blockscout, faucet and grafana"
}
// database
variable "database_master_pass" {}     //declared locally in terraform.tf
variable "database_master_username" {} //declared locally in terraform.tf

// deploy blockscout only if name tag is defined
variable "blockscout_ami_name_tag" {
  type        = string
  description = "Blockscout Name Tag for AMI created in Packer."
  default     = "blockscout-blank"
}

variable "grafana_ip" {
  type = string
  description = "Grafana IP"
  default = "10.230.3.100"
}
