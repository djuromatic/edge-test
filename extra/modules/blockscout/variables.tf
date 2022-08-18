variable "subnet_id" {
    type = string  
    description = "The subnet id to put the instance in"
}

variable "blockscout_interface_name_tag" {
  type = string
  description = "The name tag for the blockscout interface"
  default = "Blockscout EdgeNet TestNet"
}
variable "instance_type" {
    type = string
    description = "AWS ec2 instance type for blockscout"
    default = "m5.large"
}
variable "key_name" {
    type = string
    description = "SSH key for authentication to the blockscout instance"
}
variable "blockscout_root_ebs_size" {
  type = number
  description = "The root volume size in GB"
  default = 30
}
variable "blockscout_root_ebs_name_tag" {
  type = string
  description = "Name tag for blockscout ebs root instance"
  default = "Polygon EdgeNet blockscout ebs root testnet"
}
variable "blockscout_instance_name_tag" {
  type = string
  description = "Name tag for blockscout instance"
  default = "Polygon_Edge_Blockscout_TestNet"
}

variable "blockscout_cloudinit_template" {
  description = "Cloud init template for blockscout instance"
  default = false
}

variable "blockscout_ami_name_tag" {
  description = "The name tag for Blockscout AMI"
}

variable "blockscout_alb_name" {
  type = string
  description = "The name for blockscout ALB"
  default = "blockscout-alb-testnet"
}

variable "public_subnets" {
  description = "The list of public subnets"
}

variable "blockscout_alb_sec_group" {
  type = string
  description = "The security group for the Blockscout ALB"
}

variable "blockscout_instance_sec_group" {
  type = string
  description = "The security gropu for Blockscout instance"
}

variable "blockscout_alb_name_tag" {
  type = string
  description = "The name tag for blockscout ALB"
  default = "Polygon EdgeNet Blockscout ALB TestNet"
}

variable "blockscout_alb_targetgroup_name" {
  type = string
  description = "The name for Blockscout target group"
  default = "blockscout-targetgroup-testnet"
}

variable "blockscout_alb_targetgroup_port" {
  type = number
  description = "The port of the Blockscout service"
  default = 4000
}

variable "blockscout_alb_targetgroup_proto" {
  type = string
  description = "The protocol that the Blockscout service is running on the node"
  default = "HTTP"
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "blockscout_alb_listener_port" {
  type = number
  description = "The port number that will be exposed to the internet"
  default = 443
}

variable "blockscout_certificate" {
  type = string
  description = "The certificate name for Blockscout ALB"
}