output "zone_id" {
  description = "The Hosted Zone ID. This can be referenced by zone records."
  value       = module.dns_zone.zone_id
}

output "name_servers" {
  description = "A list of name servers in associated (or default) delegation set. Find more about delegation sets in"
  value       = module.dns_zone.name_servers
}

output "names" {
  description = "The names of the record."
  value       = module.dns_zone.names
}

output "fqdns" {
  description = " FQDN built using the zone domain and name."
  value       = module.dns_zone.fqdns
}
