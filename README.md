# Terraform module for AWS Route 53

### Using as Module

```hcl
module "route53example" {
  source        = "./"
  name          = "rajeev.com"
  comment       = "example zone"
  force_destroy = false
  vpc           = ["vpc-xxx"] #for Private hosted Zone

  route53_records = {
    "www" = {
      "type"           = "CNAME"
      "ttl"            = 5
      "set_identifier" = "dev"
      "records"        = ["dev.example.com"]
      "weighted_routing_policy" = {
        "weight" = "10"
      }
      "allow_overwrite"                  = false
      "multivalue_answer_routing_policy" = false
      "latency_routing_policy"           = {}
      "geolocation_routing_policy"       = {}
      "failover_routing_policy"          = {}
      "alias"                            = {}
      "health_check_id"                  = ""
    }
  }
  tags = {
    Environment = "dev"
  }
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.24 |
| aws | ~> 2.60 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.60 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| comment | A comment for the hosted zone. Defaults to 'Managed by Terraform'. | `string` | `null` | no |
| create\_zone | Do you want to create Hosted Zone | `bool` | `true` | no |
| delegation\_set\_id | The ID of the reusable delegation set whose NS records you want to assign to the hosted zone. Conflicts with vpc as delegation sets can only be used for public zones. | `string` | `null` | no |
| force\_destroy | Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. | `bool` | `false` | no |
| name | This is the name of the hosted zone | `string` | `null` | no |
| route53\_records | list of records with record types | `map` | `{}` | no |
| tags | A mapping of tags to assign to the zone. | `map` | `{}` | no |
| vpc | Configuration block(s) specifying VPC(s) to associate with a private hosted zone. Conflicts with the delegation\_set\_id argument in this resource and any aws\_route53\_zone\_association resource specifying the same zone ID | `list` | `[]` | no |
| zone\_id | Zone ID for adding route 53 records | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| name\_servers | A list of name servers in associated (or default) delegation set. Find more about delegation sets in |
| zone\_id | The Hosted Zone ID. This can be referenced by zone records. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
