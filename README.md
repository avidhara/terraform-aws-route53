# Terraform IAC for AWS Route 53

## Prerequisites

- Terraform 0.12.x
- aws cli

## Input variables

| Name              | Description                                                                                                                                                                                                                | Type   |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ |
| create_zone       | Do you want to create Hosted Zone                                                                                                                                                                                          | bool   |
| name              | This is the name of the hosted zone                                                                                                                                                                                        | string |
| comment           | A comment for the hosted zone. Defaults to 'Managed by Terraform'                                                                                                                                                          | string |
| delegation_set_id | The ID of the reusable delegation set whose NS records you want to assign to the hosted zone. Conflicts with vpc as delegation sets can only be used for public zones.                                                     | string |
| force_destroy     | Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone.                                                                                                               | bool   |
| tags              | A mapping of tags to assign to the zone.                                                                                                                                                                                   | map    |
| vpc               | Configuration block(s) specifying VPC(s) to associate with a private hosted zone. Conflicts with the delegation_set_id argument in this resource and any aws_route53_zone_association resource specifying the same zone ID | list   |
| zone_id           | Zone ID for adding route 53 records                                                                                                                                                                                        | string |
| route53_records   | list of records with record types                                                                                                                                                                                          | map    |

Link: https://www.terraform.io/docs/configuration/variables.html
Please refer to example file

### Use as Standalone TF template

```bash
cp input.tfvars.example input.tfvars
terraform init
terraform plan -var-file=./input.tfvars
terraform apply -var-file=./input.tfvars
```

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

### Output variables

| Name         | Description                                                                                          |
| ------------ | ---------------------------------------------------------------------------------------------------- |
| zone_id      | The Hosted Zone ID. This can be referenced by zone records.                                          |
| name_servers | A list of name servers in associated (or default) delegation set. Find more about delegation sets in |
