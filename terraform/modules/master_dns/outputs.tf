output "zone_id" {
  description = "Root public hosted zone ID."
  value       = aws_route53_zone.root.zone_id
}

output "name_servers" {
  description = "Root public hosted zone name servers."
  value       = aws_route53_zone.root.name_servers
}