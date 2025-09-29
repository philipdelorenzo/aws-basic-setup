output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private_db[*].id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}
