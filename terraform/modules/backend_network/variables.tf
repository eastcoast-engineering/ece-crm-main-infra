variable "project_name" {
  description = "Project name used for network resource names."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the backend VPC."
  type        = string
}

variable "container_port" {
  description = "Actix container port."
  type        = number
  default     = 8080
}

variable "api_public" {
  description = "Whether the API load balancer is internet-facing."
  type        = bool
  default     = true
}

variable "api_public_cidrs" {
  description = "CIDRs allowed to reach a public API load balancer."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "api_private_cidrs" {
  description = "Additional CIDRs allowed to reach an internal API load balancer. The VPC CIDR is always included."
  type        = list(string)
  default     = []
}

variable "database_public" {
  description = "Whether the database is publicly addressable."
  type        = bool
  default     = false
}

variable "database_public_cidrs" {
  description = "CIDRs allowed to connect directly to a public database."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional resource tags."
  type        = map(string)
  default     = {}
}