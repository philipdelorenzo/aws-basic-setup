# The project variable below will be replaced with the instantiation of the Makefile.
project = "aws-base"
# Network ID - 10.10
# Node ID - 0.0
cidr_prefix = "10.10"
vpc_cidr    = "${var.cidr_prefix}.0.0/16"
