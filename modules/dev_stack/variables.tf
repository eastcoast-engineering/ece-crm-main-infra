variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "backend_image" {
  type = string
}

variable "backend_port" {
  type    = number
  default = 8080
}

variable "task_cpu" {
  type    = number
  default = 256
}

variable "task_memory" {
  type    = number
  default = 512
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "frontend_bucket_name" {
  type = string
}

variable "enable_cloudfront" {
  type    = bool
  default = false
}

variable "assign_public_ip" {
  type    = bool
  default = true
}
