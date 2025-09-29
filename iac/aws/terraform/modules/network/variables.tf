variable "name_prefix" {
  description = "Name prefix for resources"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "cidr_prefix" {
  description = "The Network ID of the VPC CIDR"
}
