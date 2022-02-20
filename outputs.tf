
output "rds_source_endpoint" {
  value = module.rds_source_db.db_endpoint
}

output "rds_target_endpoint" {
  value = module.rds_target_db.db_endpoint
}

output "ec2_client_public_dns" {
  value = module.ec2_client.ec2_public_dns
}

output "ec2_client_public_ip" {
  value = module.ec2_client.ec2_public_ip
}
