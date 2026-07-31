output "zone_id" {
  description = "Child public hosted zone ID."
  value       = aws_route53_zone.child.zone_id
}

output "name_servers" {
  description = "Child public hosted zone name servers."
  value       = aws_route53_zone.child.name_servers
}