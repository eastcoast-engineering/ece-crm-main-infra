variable "project_name" {
  type    = string
  default = "smart-erp"
}

variable "environment" {
  type    = string
  default = "production"
}

variable "aws_region" {
  type = string
}

variable "backend_image" {
  type = string
}

variable "frontend_bucket_name" {
  type = string
}

variable "enable_cloudfront" {
  type    = bool
  default = true
}
