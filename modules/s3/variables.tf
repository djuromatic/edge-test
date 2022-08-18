variable "bucket_name" {
  default = "polygon-edge-shared-testnet"
  type = string
  description = "The name for this S3 bucket. Default: polygon-edge-shared"
}

variable "bucket_name_tag" {
  default = "Polygon_Edge_Shared_Data_TestNet"
  type = string
  description = "The name tag for this S3 bucket. Default: Polygon_Edge_Shared_Data_TestNet"
}

variable "vpc_id" {
  type = string
  description = "The VPC ID in which this S3 bucket resides."
}