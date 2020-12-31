variable "create_zone_records" {
  type        = bool
  description = "(Optional) Do you want to create Route 53 records "
  default     = false
}

variable "zone_id" {
  type        = string
  description = "(Optional) The ID of the hosted zone to contain this record."
  default     = null
}

variable "records" {
  type        = any
  description = "(Optional) List of Records"
  default = {

  }
}

####### For Zones

variable "create_zone" {
  type        = bool
  description = "(Optional) Do you want to create Hosted Zone"
  default     = true
}

variable "name" {
  type        = string
  description = "(Required) This is the name of the hosted zone"
  default     = ""
}

variable "comment" {
  type        = string
  description = "(Optional) A comment for the hosted zone. Defaults to 'Managed by Terraform'."
  default     = null
}

variable "delegation_set_id" {
  type        = string
  description = "(Optional) The ID of the reusable delegation set whose NS records you want to assign to the hosted zone. Conflicts with vpc as delegation sets can only be used for public zones."
  default     = null
}

variable "force_destroy" {
  type        = bool
  description = "(Optional) Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
  default     = false
}

variable "vpc" {
  type        = list(string)
  description = "(Optional) Configuration block(s) specifying VPC(s) to associate with a private hosted zone. Conflicts with the delegation_set_id argument in this resource and any aws_route53_zone_association resource specifying the same zone ID"
  default = [

  ]
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the zone."
  default = {

  }
}
