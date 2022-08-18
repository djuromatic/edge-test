data "aws_ami" "grafana" {
    most_recent = true
    owners = [ "self" ]
    
    filter {
      name = "tag:Name"
      values = [ "Grafana_EdgeNet-testnet" ]
    }

    filter {
      name = "tag:packer"
      values = ["true"]
    }
}

data "aws_acm_certificate" "grafana_edgenet" {
  domain   = var.grafana_certificate
  statuses = ["ISSUED"]
  most_recent = true
}