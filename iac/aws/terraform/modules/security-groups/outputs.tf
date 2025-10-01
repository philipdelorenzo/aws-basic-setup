output "security_group_id" {
  description = "The ID of the created web server security group"
  value       = module.web_sg_egress.security_group_id
}
