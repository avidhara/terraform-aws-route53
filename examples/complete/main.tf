provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  region                  = "us-west-2"
}

module "dns_zone" {
  source      = "../../"
  create_zone = true
  name        = "test-explore.com"
  comment     = "This is an example domain Dont delete"

  force_destroy = true
  vpc           = var.vpc

  create_zone_records = true
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