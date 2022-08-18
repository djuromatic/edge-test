data "aws_ami" "blockscout" {
    most_recent = true
    owners = [ "self" ]
    
    filter {
      name = "tag:Name"
      values = [ var.blockscout_ami_name_tag ]
    }
}

data "aws_acm_certificate" "Blockscout_EdgeNet-testnet" {
  domain   = var.blockscout_certificate
  statuses = ["ISSUED"]
  most_recent = true
}