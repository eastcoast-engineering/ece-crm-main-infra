variable "root_domain" {
  type = string
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

variable "alias_records" {
  type = list(object({
    name    = string
    dns_name = string
    zone_id  = string
  }))
  default = []
}

