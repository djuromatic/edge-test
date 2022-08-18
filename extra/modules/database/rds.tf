// Set subnet groups for RDS Cluster
resource "aws_db_subnet_group" "polygon_databases" {
  name       = var.database_subgroup_name
  subnet_ids = var.database_subnet_ids

  tags = {
    Name = var.database_subnet_group_name_tag
  }
}

// Create DB Instance
resource "aws_db_instance" "blockscout-db" {
  allocated_storage    = var.db_storage_capacity
  engine               = "postgres"
  instance_class       = var.database_instance_type
  db_name                 = "blockscout"
  username             = var.database_master_username
  password             = var.database_master_pass
  apply_immediately = var.database_apply_immediately
  skip_final_snapshot  = var.database_skip_final_snapshot
  multi_az = var.multi_az


  db_subnet_group_name                = aws_db_subnet_group.polygon_databases.name
  vpc_security_group_ids              = var.database_security_group_ids

  tags = {
    Name = var.database_name_tag
  }
}