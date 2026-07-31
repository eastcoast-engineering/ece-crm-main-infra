output "identifier" {
  description = "RDS instance identifier."
  value       = aws_db_instance.postgres.identifier
}

output "address" {
  description = "PostgreSQL hostname."
  value       = aws_db_instance.postgres.address
}

output "endpoint" {
  description = "PostgreSQL hostname and port."
  value       = aws_db_instance.postgres.endpoint
}

output "port" {
  description = "PostgreSQL port."
  value       = aws_db_instance.postgres.port
}

output "database_name" {
  description = "Initial PostgreSQL database name."
  value       = var.database_name
}

output "database_username" {
  description = "PostgreSQL master username."
  value       = var.database_username
}

output "master_user_secret_arn" {
  description = "Secrets Manager ARN containing the RDS-managed master credentials."
  value       = aws_db_instance.postgres.master_user_secret[0].secret_arn
}