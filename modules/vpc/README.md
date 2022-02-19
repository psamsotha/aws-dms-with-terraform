# Create a VPC

Create a VPC to contain your AWS resources. Using a VPC is a best practice when using AWS resources, so that your databases, Amazon EC2 instances, security groups, and so on, are logically organized and secure.

Using a VPC for your tutorial resources also ensures that you delete all of the resources you use when you are done with the tutorial. You must delete all of the resources that a VPC contains before you can delete the VPC.

## Resources

* `vpc` - VPC used for resources
* `aws_security_group_rule.mysql_inbound` - security group inbound rule for MySQL access
* `aws_security_group_rule.postgres_inbound` - security group inbound rule for Postgres access

## Outputs

* `db_security_group_id` - default security group ID (for database access)
* `vpc_id` - ID of VPC
* `public_subnet_id` - ID of public subnet
* `private_subnet_id` - ID of private subnet
