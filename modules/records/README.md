# Terraform module for Route 53 records

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.7, < 0.14 |
| aws | >= 2.68, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.68, < 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create | (Optional) Do you want to create Route 53 records | `bool` | `true` | no |
| records | (Optional) List of Records | `any` | `{}` | no |
| zone\_id | (Required) The ID of the hosted zone to contain this record. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| fqdns | FQDN built using the zone domain and name. |
| names | The names of the record. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->