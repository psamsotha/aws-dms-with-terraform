
resource "aws_db_instance" "mysql" {
  identifier              = "dms-mysql"
  engine                  = "mysql"
  engine_version          = "8.0"
  db_name                 = "dms_sample"
  backup_retention_period = 1
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_allocated_storage
  username                = var.db_username
  password                = var.db_password
  vpc_security_group_ids  = var.vpc_security_group_ids
  availability_zone       = var.db_az
  parameter_group_name    = var.db_parameter_group
  publicly_accessible     = var.db_publicly_accessible
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "dms-rds-subnet-group"
  subnet_ids = var.db_subnet_ids
}
