variable "subdomain" {
  type = string
}

variable "alias_records" {
  type = list(object({
    name     = string
    dns_name = string
    zone_id  = string
  }))
  default = []
}
