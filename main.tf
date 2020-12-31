module "zone" {
  source            = "./modules/zone"
  create            = var.create_zone
  name              = var.name
  comment           = var.comment
  delegation_set_id = var.delegation_set_id
  force_destroy     = var.force_destroy
  vpc               = var.vpc
}

module "records" {
  source  = "./modules/records"
  create  = var.create_zone_records
  zone_id = var.create_zone ? module.zone.zone_id : var.zone_id
  records = var.records
}
