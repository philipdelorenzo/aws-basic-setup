module "vpc" {
  source   = "../vpc" # Path to the module directory
  vpc_cidr = var.vpc_cidr
  project  = var.project
}
