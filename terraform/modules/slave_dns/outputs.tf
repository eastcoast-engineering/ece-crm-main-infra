output "name_servers" {
  value = aws_route53_zone.child.name_servers
}

output "zone_id" {
  value = aws_route53_zone.child.zone_id
}