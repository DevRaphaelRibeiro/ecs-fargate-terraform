output "load_balancer_ip" {
  value = aws_lb.default.dns_name
}


output "this_rds_cluster_endpoint" {
  description = "The cluster endpoint"
  value       = module.rds_cluster_aurora_postgres.endpoint
}

