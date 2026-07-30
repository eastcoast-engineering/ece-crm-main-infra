variable "domain_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "bucket_suffix" {
  type    = string
  default = ""
}

variable "hosted_zone_id" {
  type = string
}