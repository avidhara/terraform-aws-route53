output "names" {
  description = "The names of the record."
  value = [
    for record in aws_route53_record.this :
    record.name
  ]
}

output "fqdns" {
  description = " FQDN built using the zone domain and name."
  value = [
    for record in aws_route53_record.this :
    record.fqdn
  ]
}
