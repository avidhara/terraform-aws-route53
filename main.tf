resource "aws_route53_zone" "this" {
  count             = var.create_zone ? 1 : 0
  name              = var.name
  comment           = var.comment
  delegation_set_id = var.delegation_set_id
  force_destroy     = var.force_destroy
  tags              = var.tags

  dynamic "vpc" {
    iterator = vpcid
    for_each = var.vpc
    content {
      vpc_id = vpcid.value
    }
  }
}

resource "aws_route53_record" "this" {
  for_each = var.route53_records
  zone_id  = var.create_zone? aws_route53_zone.this[0].zone_id : var.zone_id
  name     = each.key
  type     = each.value["type"]
  ttl      = each.value["ttl"] != "" ? each.value["ttl"] : null

  records         = length(each.value["records"])> 0 ? each.value["records"] : null
  set_identifier  = each.value["set_identifier"] == "" ? null : each.value["set_identifier"]
  health_check_id = each.value["health_check_id"] == "" ? null : each.value["health_check_id"]
  dynamic "alias" {
    for_each = each.value["alias"]
    content {
      name                   = each.value["alias"]["name"]
      zone_id                = each.value["alias"]["zone_id"]
      evaluate_target_health = each.value["alias"]["evaluate_target_health"]
    }
  }
  dynamic "failover_routing_policy" {
    for_each = each.value["failover_routing_policy"]
    content {
      type = each.value["failover_routing_policy"]["type"]
    }
  }
  dynamic "geolocation_routing_policy" {
    for_each = each.value["geolocation_routing_policy"]
    content {
      continent   = each.value["geolocation_routing_policy"]["continent"]
      country     = each.value["geolocation_routing_policy"]["country"]
      subdivision = each.value["geolocation_routing_policy"]["subdivision"]
    }
  }
  dynamic "latency_routing_policy" {
    for_each = each.value["latency_routing_policy"]
    content {
      region = each.value["latency_routing_policy"]["region"]
    }
  }
  dynamic "weighted_routing_policy" {
    for_each = each.value["weighted_routing_policy"]
    content {
      weight = each.value["weighted_routing_policy"]["weight"]
    }
  }
  multivalue_answer_routing_policy = length(each.value["weighted_routing_policy"]) > 0 ? null:each.value["multivalue_answer_routing_policy"]
  allow_overwrite                  = each.value["allow_overwrite"] ? each.value["allow_overwrite"]: false
}
