resource "aws_network_interface" "block_scout_interface" {
  subnet_id = var.subnet_id
  security_groups = [var.blockscout_instance_sec_group]

  tags = {
    Name = var.blockscout_interface_name_tag
  }
}

// Create ec2 grafana instance
resource "aws_instance" "blockscout_instance" {
  ami           = data.aws_ami.blockscout.id
  instance_type = var.instance_type
  key_name = var.key_name
  user_data_base64 = var.blockscout_cloudinit_template != false ? var.blockscout_cloudinit_template.rendered : ""
 
  root_block_device {
    volume_size = var.blockscout_root_ebs_size
    tags = {
        Name = var.blockscout_root_ebs_name_tag
    }
  }

  tags = {
      Name = var.blockscout_instance_name_tag
  }

  network_interface {
    network_interface_id = aws_network_interface.block_scout_interface.id
    device_index         = 0
  }

}