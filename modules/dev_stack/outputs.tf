output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  value = aws_ecs_service.backend.name
}

output "ecs_task_family" {
  value = aws_ecs_task_definition.backend.family
}

output "ecs_execution_role_arn" {
  value = aws_iam_role.ecs_task_execution.arn
}

output "ecs_task_role_arn" {
  value = aws_iam_role.ecs_task.arn
}

output "backend_security_group_id" {
  value = aws_security_group.backend_service.id
}

output "backend_subnet_ids" {
  value = data.aws_subnets.default.ids
}

output "backend_ecr_repository_url" {
  value = aws_ecr_repository.backend.repository_url
}

output "frontend_bucket_name" {
  value = aws_s3_bucket.frontend.id
}

output "frontend_website_url" {
  value = aws_s3_bucket_website_configuration.frontend.website_endpoint
}

output "frontend_cloudfront_url" {
  value = var.enable_cloudfront ? aws_cloudfront_distribution.frontend[0].domain_name : null
}
