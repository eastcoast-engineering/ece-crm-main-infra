resource "aws_route53_zone" "root" {
  name = var.root_domain
}

resource "aws_route53_record" "records" {
  for_each = {
    for r in var.records :
    "${r.name}_${r.type}" => r
  }

  zone_id = aws_route53_zone.root.zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = each.value.ttl
  records = each.value.records
}

resource "aws_route53_record" "delegations" {
  for_each = {
    for d in var.delegations :
    d.name => d
  }

  zone_id = aws_route53_zone.root.zone_id
  name    = each.value.name
  type    = "NS"
  ttl     = 300
  records = each.value.ns
}

resource "aws_route53_record" "alias" {
  for_each = {
    for r in var.alias_records :
    r.name => r
  }

  zone_id = aws_route53_zone.root.zone_id
  name    = each.value.name
  type    = "A"

  alias {
    name                   = each.value.dns_name
    zone_id                = each.value.zone_id
    evaluate_target_health = false
  }
}

