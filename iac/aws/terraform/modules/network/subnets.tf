# Private Subnets for Database (at least 2 for Aurora)
resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = modules.vpc.vpc_id
  cidr_block        = "10.0.${count.index + 10}.0/24"
  availability_zone = var.availability_zones[count.index]

  tags = merge(var.tags, {
    Name = "${var.project}-private-${count.index + 1}"
    Type = "Private"
  })
}

# Public Subnets (for NAT Gateway)
resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = modules.vpc.vpc_id
  cidr_block              = "${var.cidr_prefix}.${count.index + 1}.0/24"
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = "${var.project}-public-${count.index + 1}"
    Type = "Public"
  })
}
