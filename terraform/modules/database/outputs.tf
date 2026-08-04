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

output "credentials" {
  description = "Public PostgreSQL connection credentials. Null when publicly_accessible is false."

  value = var.publicly_accessible ? {
    identifier = aws_db_instance.postgres.identifier
    host       = aws_db_instance.postgres.address
    endpoint   = aws_db_instance.postgres.endpoint
    port       = aws_db_instance.postgres.port
    database   = var.database_name

    username = local.postgres_master_credentials["username"]
    password = local.postgres_master_credentials["password"]

    secret_arn = aws_db_instance.postgres.master_user_secret[0].secret_arn
    ssl_mode   = "require"
  } : null

  sensitive = true
}