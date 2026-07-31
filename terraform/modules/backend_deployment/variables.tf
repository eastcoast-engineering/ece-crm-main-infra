variable "project_name" {
  description = "Project name used in backend resource names."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "aws_region" {
  description = "AWS region."
  type        = string
}

variable "domain_name" {
  description = "API domain name."
  type        = string
}

variable "public_hosted_zone_id" {
  description = "Public Route 53 zone used for ACM validation and the public API alias."
  type        = string
}

variable "api_public" {
  description = "Whether the ALB and API DNS record are public."
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "Backend VPC ID."
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs. ECS tasks use these subnets to avoid requiring a NAT gateway."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs. An internal ALB uses these subnets."
  type        = list(string)
}

variable "load_balancer_security_group_id" {
  description = "ALB security group ID."
  type        = string
}

variable "ecs_security_group_id" {
  description = "ECS task security group ID."
  type        = string
}

variable "database_host" {
  description = "PostgreSQL hostname."
  type        = string
}

variable "database_port" {
  description = "PostgreSQL port."
  type        = number
}

variable "database_name" {
  description = "PostgreSQL database name."
  type        = string
}

variable "database_username" {
  description = "PostgreSQL username."
  type        = string
}

variable "database_secret_arn" {
  description = "Secrets Manager ARN containing a password JSON key."
  type        = string
}

variable "container_port" {
  description = "Actix container port."
  type        = number
  default     = 8080
}

variable "health_check_path" {
  description = "ALB health-check path."
  type        = string
  default     = "/health"
}

variable "task_cpu" {
  description = "Fargate task CPU units."
  type        = number
  default     = 512
}

variable "task_memory" {
  description = "Fargate task memory in MiB."
  type        = number
  default     = 1024
}

variable "initial_desired_count" {
  description = "Initial ECS desired count. Keep at zero until the first image is deployed by GitHub Actions."
  type        = number
  default     = 0
}

variable "container_environment" {
  description = "Additional non-sensitive Actix environment variables."
  type        = map(string)
  default     = {}
}

variable "log_retention_days" {
  description = "CloudWatch log retention period."
  type        = number
  default     = 30
}

variable "ecr_force_delete" {
  description = "Whether Terraform may delete a non-empty ECR repository."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional backend resource tags."
  type        = map(string)
  default     = {}
}