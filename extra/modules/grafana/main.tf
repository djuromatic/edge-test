// Create interface for Grafana
resource "aws_network_interface" "grafana_interface" {
  subnet_id = var.subnet_id
  security_groups = var.grafana_sec_groups
  ## ip addresses for grafana  need to be static
  private_ips = [ var.grafana_ip ] 

  tags = {
    Name = var.grafana_interface_name_tag
  }
}

// Create ec2 grafana instance
resource "aws_instance" "grafana_instance" {
  ami           = data.aws_ami.grafana.id
  instance_type = var.instance_type
  key_name = var.key_name
#  user_data_base64 = var.grafana_cloud_init_template != false ? var.grafana_cloud_init_template.rendered : ""

 
  root_block_device {
    volume_size = var.grafana_ebs_root_size
    tags = {
        Name = var.grafana_ebs_root_name_tag
    }
  }

  tags = {
      Name = var.grafana_instance_name_tag
  }

  network_interface {
    network_interface_id = aws_network_interface.grafana_interface.id
    device_index         = 0
  }

}