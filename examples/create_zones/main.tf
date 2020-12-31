provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  region                  = "us-east-1"
}

module "dns_zone" {
  source              = "../../"
  create_zone         = true
  create_zone_records = false
  name                = "test-explore.com"
  comment             = "This is an example domain"

  force_destroy = true
  vpc           = ["vpc-xxxxxxx"]

}