

module "frontend_oidc" {
  source       = "../../modules/frontend-oidc"
  github_repo  = var.front_website_github_repo
  branch  = var.front_website_github_branch
}

module "slave_dns" {
  source    = "../../modules/slave_dns"
  subdomain = "${var.sub_domain}.${var.root_domain}"

  alias_records = [
    {
      name     = "${var.sub_domain}.${var.root_domain}"
      dns_name = module.frontend.cloudfront_domain
      zone_id  = module.frontend.cloudfront_zone_id
    }
  ]
  
}

module "frontend" {
  source        = "../../modules/frontend_infrastructure"
  domain_name   = "${var.sub_domain}.${var.root_domain}"
  environment   = var.environment
  hosted_zone_id = module.slave_dns.zone_id
}




