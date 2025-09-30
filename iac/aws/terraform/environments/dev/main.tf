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

module "main_stack" {
  source = "../../"

  project     = var.project
  vpc_cidr    = var.vpc_cidr
  cidr_prefix = var.cidr_prefix
  OIDC_ROLE   = var.OIDC_ROLE # This is the GitHub OIDC role for your EKS cluster management with GitHub Actions
  environment = "dev"
  REGION      = var.REGION # TF_VAR_REGION must be set in your environment or Doppler

  tags = {
    Owner       = "Dev Team"
    Environment = "development"
  }
}
