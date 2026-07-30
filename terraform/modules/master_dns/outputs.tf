output "zone_id" {
  value = aws_route53_zone.root.zone_id
}

output "name_servers" {
  value = aws_route53_zone.root.name_servers
}
