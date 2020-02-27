output "zone_id" {
  description = "The Hosted Zone ID. This can be referenced by zone records."
  value       = var.create_zone ? aws_route53_zone.this[0].zone_id : var.zone_id
}

output "name_servers" {
  description = "A list of name servers in associated (or default) delegation set. Find more about delegation sets in"
  value       = aws_route53_zone.this[0].name_servers
}
