data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

locals {
  project_slug = trim(
    replace(lower(var.project_name), "/[^a-z0-9-]+/", "-"),
    "-"
  )

  environment_slug = trim(
    replace(lower(var.environment), "/[^a-z0-9-]+/", "-"),
    "-"
  )

  name_prefix    = substr("${local.project_slug}-${local.environment_slug}", 0, 24)
  container_name = "${local.name_prefix}-api"

  load_balancer_subnet_ids = var.api_public ? var.public_subnet_ids : var.private_subnet_ids

  ecs_service_arn = "arn:${data.aws_partition.current.partition}:ecs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:service/${aws_ecs_cluster.api.name}/${aws_ecs_service.api.name}"

  common_tags = merge(
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Component   = "Backend"
    },
    var.tags
  )
}