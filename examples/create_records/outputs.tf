output "names" {
  description = "The names of the record."
  value       = module.dns_records.names
}

output "fqdns" {
  description = " FQDN built using the zone domain and name."
  value       = module.dns_records.fqdns
}
