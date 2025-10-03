provider "aws" {
  region  = var.REGION
  profile = var.profile
}

terraform {
  backend "s3" {
    bucket  = "${var.project}-terraform-state"
    key     = "${var.project}/dev/terraform.tfstate"
    profile = var.profile
    region  = var.REGION
  }
}

module "aurora_stack" {
  source     = "../../"
  project    = var.project
  network_id = var.network_id
  vpc_cidr   = var.vpc_cidr
}
