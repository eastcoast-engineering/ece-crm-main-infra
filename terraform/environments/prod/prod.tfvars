environment = "prod"
root_domain = "quotashark.com"

front_website_github_repo = "eastcoast-engineering/eastcoast-engineering-CRM-frontend"
front_website_github_branch = "main"


records = [
  # # email receiving MX record via improvMX
  # {
  #   name    = "quotashark.com"
  #   type    = "MX"
  #   ttl     = 300
  #   records = [
  #     "10 mx1.improvmx.com",
  #     "20 mx2.improvmx.com"
  #   ]
  # },
  # {
  #   name    = "quotashark.com"
  #   type    = "TXT"
  #   ttl     = 300
  #   records = [
  #     "v=spf1 include:spf.improvmx.com ~all"
  #   ]
  # },
  # # email sending DKIM
  # {
  #   name    = "dkimprovmx1._domainkey"
  #   type    = "CNAME"
  #   ttl     = 300
  #   records = [
  #     "dkimprovmx1.improvmx.com"
  #   ]
  # },
  # {
  #   name    = "dkimprovmx2._domainkey"
  #   type    = "CNAME"
  #   ttl     = 300
  #   records = [
  #     "dkimprovmx2.improvmx.com"
  #   ]
  # },
  # {
  #   name    = "_dmarc"
  #   type    = "TXT"
  #   ttl     = 300
  #   records = [
  #     "v=DMARC1; p=none;"
  #   ]
  # },
  # # google crawler
  # {
  #   name    = "sr5qj33szxau"
  #   type    = "CNAME"
  #   ttl     = 300
  #   records = [
  #     "gv-cv7smpbbxbatj2.dv.googlehosted.com"
  #   ]
  # },
  # www subdomain
  {
    name    = "www"
    type    = "CNAME"
    ttl     = 300
    records = [
      "quotashark.com"
    ]
  }
]

# Delegated child zones
delegations = [
  {
    name = "dev.quotashark.com"
    ns = [
      "ns-1405.awsdns-47.org",
      "ns-1673.awsdns-17.co.uk",
      "ns-728.awsdns-27.net",
      "ns-95.awsdns-11.com",
    ]
  }
]

