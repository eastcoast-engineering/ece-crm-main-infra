resource "aws_route53_zone" "child" {
  name = var.subdomain
}

resource "aws_route53_record" "alias" {
  for_each = {
    for r in var.alias_records :
    r.name => r
  }

  zone_id = aws_route53_zone.child.zone_id
  name    = each.value.name
  type    = "A"

  alias {
    name                   = each.value.dns_name
    zone_id                = each.value.zone_id
    evaluate_target_health = false
  }
}

