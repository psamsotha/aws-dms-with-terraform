
resource "aws_db_parameter_group" "mysql_params" {
  family = "mysql8.0"
  name = "dms-mysql-parameters"
  description = "Group for specifying binary log settings for replication"

  parameter {
    name = "binlog_checksum"
    value = "NONE"
  }

  parameter {
    name = "binlog_format"
    value = "ROW"
  }
}

resource "aws_db_parameter_group" "postgres_params" {
  family = "postgres12"
  name = "dms-postgresql-parameters"
  description = "Group for specifying role setting for replication"

  parameter {
    name = "session_replication_role"
    value = "replica"
  }
}
