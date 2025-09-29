locals {
  common_tags = merge(
    var.tags,
    {
      Environment = var.environment
      Project     = var.project
      ManagedBy   = "Terraform"
    }
  )

  name_prefix = "${var.project}-${var.environment}"
}
