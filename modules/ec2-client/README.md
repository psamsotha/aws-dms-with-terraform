# Create an Amazon EC2 client

In this section, you create an Amazon EC2 client. You use this client to populate your source database with data to replicate. You also use this client to verify replication by running queries on the target database.

Using an Amazon EC2 client to access your databases provides the following advantages over accessing your databases over the internet:

* You can restrict access to your databases to clients that are in the same VPC.
* We have confirmed that the tools you use in this tutorial work, and are easy to install, on Amazon Linux 2, which we recommend for this tutorial.
* Data operations between components in a VPC generally perform better than those over the internet.

### EC2 User Data

```bash
yum install -y git
yum install -y mariadb
amazon-linux-extras install -y postgresql12
cd ~
git clone https://github.com/aws-samples/aws-database-migration-samples.git
```

The user data will install the Git, MariaDb (which includes the MySQL client), the Postgres client, and clone the data for the source database. Once the instance is up, SSH into the instance and populate the source database

## Resources

* `aws_security_group.dataeng_sg` - security group for EC2 instance
* `aws_ami.amazon-linux-2` - AMI for Amazon Linux 2
* `aws_instance.mysql_client` - MySQL client EC2 instance.

## Outputs

* `ec2_public_dns` - public DNS of instance
* `ec2_public_ip` - public IP of instance
