variable "project" {
  description = "Name of the project"
  type        = string
}

variable "OIDC_ROLE" {
  description = "OIDC role for the EKS cluster"
  type        = string
}

variable "REGION" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "default"
}

variable "cidr_prefix" {
  description = "The Network ID of the VPC CIDR"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}
