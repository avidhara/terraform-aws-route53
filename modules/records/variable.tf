variable "create" {
  type        = bool
  description = "(Optional) Do you want to create Route 53 records "
  default     = true
}

variable "zone_id" {
  type        = string
  description = "(Required) The ID of the hosted zone to contain this record."
}

variable "records" {
  type        = any
  description = "(Optional) List of Records"
  default = {

  }
}
