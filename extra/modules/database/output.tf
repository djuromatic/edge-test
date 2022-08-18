output "database_dns" {
  value = aws_db_instance.blockscout-db.endpoint
  description = "Database connection endpoint"
}