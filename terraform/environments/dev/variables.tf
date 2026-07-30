variable "front_website_github_repo" {
  type = string
  description = "GitHub repository for the frontend website"
}

variable "front_website_github_branch" {
  type = string
  description = "GitHub branch for the frontend website allowed to push to this environment"
  default = "dev"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "root_domain" {
  default = "quotashark.com"
}

variable "sub_domain" {
  default = "dev"
}

