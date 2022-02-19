# Create Amazon RDS parameter groups

To specify settings for your source and target databases for AWS DMS, use Amazon RDS parameter groups. To allow initial and ongoing replication between your databases, make sure to configure the following:

* Your source database's binary log, so that AWS DMS can determine what incremental updates it needs to replicate.
* Your target database's replication role, so that AWS DMS ignores foreign key constraints during the initial data transfer. With this setting, AWS DMS can migrate data out of order.

## Resources

* `aws_db_parameter_group.mysql_params` - parameter group for MySQL source database
* `aws_db_parameter_group.postgres_params` - parameter group for Postgres target database
