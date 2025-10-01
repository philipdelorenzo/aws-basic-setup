variable "project" {
  description = "Name prefix for resources"
  type        = string
}

variable "network_id" {
  description = "Network ID for VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
