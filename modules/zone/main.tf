resource "aws_route53_zone" "this" {
  count             = var.create ? 1 : 0
  name              = var.name
  comment           = var.comment
  delegation_set_id = var.delegation_set_id
  force_destroy     = var.force_destroy
  tags              = var.tags

  dynamic "vpc" {
    for_each = var.vpc
    iterator = vpcid
    content {
      vpc_id = vpcid.value
    }
  }
}