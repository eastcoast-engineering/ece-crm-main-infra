locals {
  frontend_domain = "${var.sub_domain}.${var.root_domain}"
}

module "slave_dns" {
  source = "../../modules/slave_dns"

  subdomain = local.frontend_domain

  alias_records = [
    {
      name     = local.frontend_domain
      dns_name = module.frontend.cloudfront_domain
      zone_id  = module.frontend.cloudfront_zone_id
    }
  ]
}

module "frontend" {
  source = "../../modules/frontend_infrastructure"

  domain_name    = local.frontend_domain
  environment    = var.environment
  hosted_zone_id = module.slave_dns.zone_id
}

module "frontend_oidc" {
  source = "../../modules/oidc"

  project_name = "quotashark"
  environment  = var.environment

  github_repo = var.front_website_github_repo
  branch      = var.front_website_github_branch

  frontend_bucket_arn = module.frontend.bucket_arn

  cloudfront_distribution_arn = (
    module.frontend.cloudfront_distribution_arn
  )
}