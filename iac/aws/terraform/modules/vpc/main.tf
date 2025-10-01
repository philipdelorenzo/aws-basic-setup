data "aws_availability_zones" "available" {}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project}-vpc"
  cidr = var.vpc_cidr

  azs = ["us-west-2a"]

  # Let's reserve 10.10.200-205.0/24 for public subnets
  public_subnets = ["${var.network_id}.200.0/24"]

  # Let's reserve 10.10.1-49.0/24 for private subnets - Applications
  private_subnets = ["${var.network_id}.1.0/24"]

  # Databases -- 10.10.50-55.0/24 for databases
  database_subnets = ["${var.network_id}.50.0/24"]

  create_igw         = true # This is to create our internet gateway for the VPC
  single_nat_gateway = true # Sets one NAT gateway
  enable_nat_gateway = true # Enables a NAT gateway - so our private services can connect to the internet if needed
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    GithubRepo  = "${var.project}-vpc"
    GithubOrg   = "philipdelorenzo"
    Environment = "dev"
  }
}
