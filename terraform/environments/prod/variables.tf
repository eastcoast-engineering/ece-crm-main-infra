variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "root_domain" {
  type = string
  default = "quotashark.com"
}

variable "front_website_github_repo" {
  type = string
  description = "GitHub repository for the frontend website"
}

variable "front_website_github_branch" {
  type = string
  description = "GitHub branch for the frontend website allowed to push to this environment"
  default = "main"
}


variable "records" {
  type = list(object({
    name    = string
    type    = string
    ttl     = number
    records = list(string)
  }))
}

variable "delegations" {
  type = list(object({
    name = string
    ns   = list(string)
  }))
}

