
resource "aws_db_instance" "postgres" {
  identifier              = "dms-postgresql"
  engine                  = "postgres"
  engine_version          = "12"
  backup_retention_period = 1
  skip_final_snapshot     = true
  db_subnet_group_name    = var.db_subnet_group_name
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_allocated_storage
  username                = var.db_username
  password                = var.db_password
  vpc_security_group_ids  = var.vpc_security_group_ids
  availability_zone       = var.db_az
  parameter_group_name    = var.db_parameter_group
  publicly_accessible     = var.db_publicly_accessible
}
