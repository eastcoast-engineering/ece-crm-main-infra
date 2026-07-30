module "frontend_oidc" {
  source       = "../../modules/frontend-oidc"
  github_repo  = var.front_website_github_repo
  branch  = var.front_website_github_branch
}

module "master_dns" {
  source = "../../modules/master_dns"

  root_domain = var.root_domain
  records     = var.records
  delegations = var.delegations

  alias_records = [
    {
      name     = var.root_domain  
      dns_name = module.frontend.cloudfront_domain
      zone_id  = module.frontend.cloudfront_zone_id
    }
  ]
}

module "frontend" {
  source        = "../../modules/frontend_infrastructure"
  domain_name  = var.root_domain
  environment   = var.environment
  hosted_zone_id = module.master_dns.zone_id
}




