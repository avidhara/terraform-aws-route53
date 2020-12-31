# Example to create Route 53 records 
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc | (Optional) Configuration block(s) specifying VPC(s) to associate with a private hosted zone. Conflicts with the delegation\_set\_id argument in this resource and any aws\_route53\_zone\_association resource specifying the same zone ID | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| fqdns | FQDN built using the zone domain and name. |
| name\_servers | A list of name servers in associated (or default) delegation set. Find more about delegation sets in |
| names | The names of the record. |
| zone\_id | The Hosted Zone ID. This can be referenced by zone records. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->