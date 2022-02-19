
output "rds_source_endpoint" {
  value = module.rds_source_db.db_endpoint
}

output "rds_target_endpoint" {
  value = module.rds_target_db.db_endpoint
}
