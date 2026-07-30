output "dev_name_servers" {
  value = module.slave_dns.name_servers
}

output "frontend" {
  value = {
    dns_name = module.frontend.cloudfront_domain
    zone_id  = module.frontend.cloudfront_zone_id
    bucket  = module.frontend.bucket_name
  }
}

output "dev_oidc_role_arn" {
  value = module.frontend_oidc.role_arn
}