# VPC
module "vpc" {
  source = "./modules/vpc"

  name_prefix        = local.name_prefix
  tags               = local.common_tags
  vpc_cidr = var.vpc_cidr
}

# Networking Module
module "networking" {
  source = "./modules/networking"

  name_prefix        = local.name_prefix
  availability_zones = data.aws_availability_zones.available.names
  tags               = local.common_tags
}
