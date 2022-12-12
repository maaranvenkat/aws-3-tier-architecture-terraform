output "lb_dns_name" {
  value       = aws_lb.my-alb.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.my-database.endpoint
}
