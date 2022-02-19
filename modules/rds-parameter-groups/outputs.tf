
output "mysql_param_group" {
  value = aws_db_parameter_group.mysql_params.name
}

output "postgres_param_group" {
  value = aws_db_parameter_group.postgres_params.name
}
