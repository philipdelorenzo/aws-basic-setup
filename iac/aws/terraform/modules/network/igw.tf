# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = modules.vpc.vpc_id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-igw"
  })
}
