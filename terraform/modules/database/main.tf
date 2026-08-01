locals {
  project_slug = trim(
    replace(lower(var.project_name), "/[^a-z0-9-]+/", "-"),
    "-"
  )

  environment_slug = trim(
    replace(lower(var.environment), "/[^a-z0-9-]+/", "-"),
    "-"
  )

  name_prefix = substr("${local.project_slug}-${local.environment_slug}", 0, 24)

  subnet_ids = var.publicly_accessible ? var.public_subnet_ids : var.private_subnet_ids

  common_tags = merge(
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Component   = "Database"
    },
    var.tags
  )
}

resource "aws_db_subnet_group" "postgres" {
  name       = "${local.name_prefix}-postgres-subnets"
  subnet_ids = local.subnet_ids

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-postgres-subnets"
  })
}

resource "aws_db_instance" "postgres" {
  identifier = "${local.name_prefix}-postgres"

  engine         = "postgres"
  engine_version = var.engine_version
  instance_class = var.instance_class

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = var.database_name
  username = var.database_username
  port     = 5432

  manage_master_user_password = true

  db_subnet_group_name   = aws_db_subnet_group.postgres.name
  vpc_security_group_ids = [var.security_group_id]
  publicly_accessible    = var.publicly_accessible
  multi_az               = var.multi_az

  backup_retention_period = var.backup_retention_days
  copy_tags_to_snapshot   = true

  auto_minor_version_upgrade = true
  apply_immediately          = var.apply_immediately

  deletion_protection = var.deletion_protection
  skip_final_snapshot = var.skip_final_snapshot

  final_snapshot_identifier = var.skip_final_snapshot ? null : "${local.name_prefix}-postgres-final"

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-postgres"
  })
}