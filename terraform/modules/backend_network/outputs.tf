output "vpc_id" {
  description = "Backend VPC ID."
  value       = aws_vpc.backend.id
}

output "vpc_cidr" {
  description = "Backend VPC CIDR."
  value       = aws_vpc.backend.cidr_block
}

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs."
  value       = aws_subnet.private[*].id
}

output "load_balancer_security_group_id" {
  description = "API load balancer security group ID."
  value       = aws_security_group.load_balancer.id
}

output "ecs_security_group_id" {
  description = "ECS task security group ID."
  value       = aws_security_group.ecs.id
}

output "database_security_group_id" {
  description = "PostgreSQL security group ID."
  value       = aws_security_group.database.id
}