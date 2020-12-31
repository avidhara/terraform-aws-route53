provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  region                  = "us-east-1"
}

module "dns_records" {
  source              = "../../"
  create_zone         = false
  create_zone_records = true
  zone_id             = var.zone_id
  records = {
    test = {
      type = "CNAME"
      ttl  = "300"
      weighted_routing_policy = [{
        weight = 10
      }]
      set_identifier = "dev"
      records        = ["dev.example.com"]
    }
  }

}