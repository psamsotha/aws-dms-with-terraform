
output "default_security_group_id" {
  value = module.vpc.default_security_group_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "azs" {
  value = module.vpc.azs
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.rds_subnet_group.name
}
