variable "vpc_cidr_block" {
  default = "10.250.0.0/16"
  type = string
  description = "The CIDR subnet for this VPC. Default: 10.250.0.0/16"
}

variable "vpc_name_tag" {
  default = "Polygon_Edge_VPC_TestNet"
  type = string
  description = "The name tag for this VPC. Default: Polygon_Edge_VPC"
}

variable "az" {
  default = ["us-west-2a","us-west-2b","us-west-2c","us-west-2d"]
  type = list(string)
  description = "The availability zones in this VPC. Default: us-west-2a/b/c/d"
}

variable "lan_subnets" {
  default = ["10.250.1.0/24","10.250.2.0/24","10.250.3.0/24","10.250.4.0/24"]
  type = list(string)
  description = "The internal/private networks. Defaults: 10.250.(1,2,3,4).0/24"
}

variable "lan_subnets_name_tag" {
  default = "Polygon_Edge_Internal_Subnet_TestNet"
  type = string
  description = "The name tag for internal networks. Default: Polygon_Edge_Ineternal_Subnet"
}

variable "public_subnets" {
  default = ["10.250.251.0/24","10.250.252.0/24","10.250.253.0/24","10.250.254.0/24"]
  type = list(string)
  description = "The public network subnets. Defaults: 10.250.(251,252,253,254).0/24"
}

variable "db_subnets" {
  default = ["10.250.31.0/24","10.250.32.0/24","10.250.33.0/24","10.250.34.0/24"]
  type = list(string)
  description = "The public network subnets. Defaults: 10.250.(31,32,33,34).0/24"
}

variable "public_subnets_name_tag" {
  default = "Polygon_Edge_Public_Subnet_testnet"
  type = string
  description = "The name tag for public network subnets. Default: Polygon_Edge_Public_Subnet_testnet"
}

variable "db_subnets_name_tag" {
  default = "Polygon_Edge_Database_Subnet_testnet"
  type = string
  description = "The name tag for private database subnets. Default: Polygon_Edge_Database_Subnet_testnet"
}

variable "nat_gateway_name_tag" {
  default = "Polygon_Edge_NAT_Gateway_testnet"
  type = string
  description = "The name tag for NAT gateway. Default: Polygon_Edge_NAT_Gateway_testnet"
}

variable "default_route_name_tag" {
  default = "Polygon_Edge_Default_Route_testnet"
  type = string
  description = "The name tag for the default route. Default: Polygon_Edge_Default_Route_testnet"
}
