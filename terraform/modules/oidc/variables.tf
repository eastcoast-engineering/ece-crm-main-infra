variable "project_name" {
  description = "Short application name used for IAM resource names."
  type        = string

  validation {
    condition     = length(trimspace(var.project_name)) > 0
    error_message = "project_name cannot be empty."
  }
}

variable "environment" {
  description = "Deployment environment, such as dev or prod."
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "environment must be dev or prod."
  }
}

variable "github_repo" {
  description = "GitHub repository in owner/repository format."
  type        = string

  validation {
    condition     = length(split("/", var.github_repo)) == 2
    error_message = "github_repo must use the owner/repository format."
  }
}

variable "branch" {
  description = "GitHub branch allowed to assume the deployment role."
  type        = string

  validation {
    condition     = length(trimspace(var.branch)) > 0
    error_message = "branch cannot be empty."
  }
}

variable "frontend_bucket_arn" {
  description = "ARN of the frontend S3 bucket."
  type        = string
}

variable "cloudfront_distribution_arn" {
  description = "ARN of the frontend CloudFront distribution."
  type        = string
}