variable "subnet_id" {
  type = string
  description = "The subnet that we're placing Grafana in. "
}
variable "grafana_sec_groups" {
  type = list(string)
  description = "The security groups to attach to Grafana instance"
}
variable "grafana_ip" {
  type = string
  description = "The IP address for Grafana instance"
}
variable "instance_type" {
  type = string
  description = "The instance type for Grafana"
  default = "t2.large"
}
variable "key_name" {
  type = string
  description = "The ssh key for auth to Grafana instance"
}
variable "grafana_interface_name_tag" {
  type = string
  description = "Name Tag for Grafana interface"
  default = "Polygon EdgeNet Grafana TestNet"
}

variable "grafana_ebs_root_size" {
  type = number
  description = "EBS Root volume size"
  default = 50
}
variable "grafana_ebs_root_name_tag" {
  type = string
  description = "Grafana EBS Root volume name tag"
  default = "Grafana EBS Root Volume TestNet"
}
variable "grafana_instance_name_tag" {
  type = string
  description = "Grafana instance name tag"
  default = "Polygon EdgeNet Grafana TestNet"
}

variable "grafana_alb_name" {
  type = string
  default = "grafana-alb-testnet"
}

variable "public_subnets" {
  type = any
  default = "The object list of public subnets to place the ALB in testnet"
}

variable "grafana_alb_sec_group" {
  type = string
  description = "The security group for Grafana ALB"
}

variable "grafana_alb_name_tag" {
  type = string
  description = "Name tag for Grafana ALB"
  default = "Polygon Edge Grafana ALB TestNet"
}

variable "grafana_alb_targetgroup_name" {
  type = string
  default = "grafana-targetgroup-testnet"
  description = "Name of the Grafana instances targetgroup testnet"
}

variable "grafana_alb_targetgroup_port" {
  type = number
  default = 3000
  description = "The service port that Grafana is running on"
}

variable "grafana_alb_targetgroup_proto" {
  type = string
  default = "HTTP"
  description = "The protocol that Grafana service is running on"
}

variable "vpc_id" {
  type = string
  description = "The VPC ID"
}

variable "grafana_alb_listen_port" {
  type = number
  default = 443
  description = "The port number that Grafana ALB will listen on"
}

variable "grafana_certificate" {
  type = string
  description = "The certificate name for Grafana ALB"
}