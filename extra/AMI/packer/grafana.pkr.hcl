packer {
  required_plugins {
   amazon-ebs = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "grafana" {
  ## your ~/.aws/credentials profile
  profile = "rario"
  ami_name = "grafana-edgenet-${local.timestamp}"
  instance_type = "c5.4xlarge"
  region = "us-west-2"
  ### Ubuntu 20.04 LTS
  source_ami = "ami-0ddf424f81ddb0720"
  ### Place sec group that can communicate with database - Terraform output
  security_group_ids = ["sg-06aa18707013ecc32"]
  ssh_username = "ubuntu"
  ssh_bastion_username = "ubuntu"
  ssh_bastion_private_key_file = "~/.ssh/id_rsa"
  ### Place instance in subnet that can reach database - Terraform output
  subnet_id = "subnet-0f7becc655c5ce10a"
  ### Set IP of the bastion host
  ssh_bastion_host = "54.245.223.208"
  tags = {
    "Name" = "Grafana_EdgeNet-testnet"
    "packer" = "true"
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}


build {
  name = "grafana"
  sources = [
    "source.amazon-ebs.grafana"
  ]

  provisioner "ansible" {
    playbook_file = "../ansible/grafana.yml"
    user = "ubuntu"
    use_proxy = false
  }
}
