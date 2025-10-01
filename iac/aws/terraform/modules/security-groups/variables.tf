variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "The ID of the VPC defined in ../modules/vpc"
  type        = string
}

variable "public_subnets" {
  description = "The ID of the VPC defined in ../modules/vpc"
  type        = list(any)
}
