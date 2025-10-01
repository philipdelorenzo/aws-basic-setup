output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC - CIDR notation"
  value       = module.vpc.default_vpc_cidr_block
  depends_on  = [module.vpc.main]
}
output "public_subnets" {
  description = "The public subnets for this VPC"
  value       = module.vpc.public_subnets_cidr_blocks
  depends_on  = [module.vpc.main]
}

output "private_subnets" {
  description = "The private subnets for this VPC"
  value       = module.vpc.private_subnets_cidr_blocks
  depends_on  = [module.vpc.main]
}
