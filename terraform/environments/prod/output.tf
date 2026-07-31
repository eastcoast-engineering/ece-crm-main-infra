output "frontend_github_role_arn" {
  value = module.frontend_oidc.role_arn
}

output "backend_api_url" {
  value = module.backend.api_url
}

output "backend_github_role_arn" {
  value = module.backend_oidc.role_arn
}

output "backend_ecr_repository_name" {
  value = module.backend.ecr_repository_name
}

output "backend_ecs_cluster_name" {
  value = module.backend.ecs_cluster_name
}

output "backend_ecs_service_name" {
  value = module.backend.ecs_service_name
}

output "backend_task_definition_family" {
  value = module.backend.ecs_task_definition_family
}

output "backend_container_name" {
  value = module.backend.ecs_container_name
}

output "database_endpoint" {
  value = module.database.endpoint
}

output "root_zone_name_servers" {
  value = module.master_dns.name_servers
}