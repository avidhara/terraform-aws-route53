variable "create_zone" {
  type        = bool
  description = "Do you want to create Hosted Zone"
  default     = true
}

variable "name" {
  type        = string
  description = "This is the name of the hosted zone"
  default     = null
}

variable "comment" {
  type        = string
  description = "A comment for the hosted zone. Defaults to 'Managed by Terraform'."
  default     = null
}

variable "delegation_set_id" {
  type        = string
  description = "The ID of the reusable delegation set whose NS records you want to assign to the hosted zone. Conflicts with vpc as delegation sets can only be used for public zones."
  default     = null
}

variable "force_destroy" {
  type        = bool
  description = "Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
  default     = false
}

variable "tags" {
  type        = map
  description = "A mapping of tags to assign to the zone."
  default = {

  }
}

variable "vpc" {
  type        = list
  description = "Configuration block(s) specifying VPC(s) to associate with a private hosted zone. Conflicts with the delegation_set_id argument in this resource and any aws_route53_zone_association resource specifying the same zone ID"
  default     = []
}
################## Route 53 records ############

variable "zone_id" {
  type        = string
  description = "Zone ID for adding route 53 records"
  default     = null
}

variable "route53_records" {
  type        = map
  description = "list of records with record types"
  default = {

  }
}
