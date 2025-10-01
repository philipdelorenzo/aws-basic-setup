
module "web_sg_egress" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "web-server-egress-sg"
  description = "Security Group for web application instance egress"
  vpc_id      = var.vpc_id

  # ------------------------------------------------------------------
  # EGRESS RULES (Outbound Traffic)
  # ------------------------------------------------------------------
  egress_with_cidr_blocks = [
    {
      # Allow all outbound traffic to the public internet
      rule        = "all-all"
      from_port   = 0
      to_port     = 0
      protocol    = "-1" # All protocols
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Name = "Public-Web-Egress"
  }
}

resource "aws_security_group" "web_sg_dynamic_ingress" {
  name        = "web-server-access-dynamic"
  description = "Allows HTTP/HTTPS from specific CIDRs (dynamic)"
  vpc_id      = var.vpc_id

  # Dynamic block for HTTP access
  dynamic "ingress" {
    for_each = var.public_subnets
    content {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = [ingress.value] # ingress.value is the current CIDR block
    }
  }

  # Dynamic block for HTTPS access
  dynamic "ingress" {
    for_each = var.public_subnets
    content {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = [ingress.value] # ingress.value is the current CIDR block
    }
  }

  tags = {
    Name = "Public-Web-Ingress"
  }
}
