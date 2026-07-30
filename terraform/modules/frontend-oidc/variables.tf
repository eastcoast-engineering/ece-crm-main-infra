variable "github_repo" {
  description = "GitHub repository name in format owner/repo"
  type        = string
}

variable "branch" {
  description = "Environment name (dev/prod)"
  type        = string
}
