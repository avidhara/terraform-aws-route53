# Example to create Route 53 records 
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| zone\_id | (Required) The ID of the hosted zone to contain this record. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| fqdns | FQDN built using the zone domain and name. |
| names | The names of the record. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->