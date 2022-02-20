# Prerequisites for AWS Database Migration Service

All of the setup is done with Terraform. Only populating the source database needs to be done manually. First deploy the infrastructure, then populate the database.

## Topics

* [Create a VPC](../modules/vpc/README.md)
* [Create Amazon RDS parameter groups](../modules/rds-parameter-groups/README.md)
* [Create your source Amazon RDS database](../modules/rds-source-db/README.md)
* [Create your target Amazon RDS database](../modules/rds-target-db/README.md)
* [Create an Amazon EC2 client](../modules/ec2-client/README.md)
* [Populate your source database](#set-up)

## Set Up

1. Deploy infrastructure
    1. Create `tfvars` file – create a `dev.tfvars` file at the root of thr project. Add the following variables:
        ```terraform
        aws_profile              = "<aws-profile/default>"
        aws_region               = "<aws-region: us-west-2>"
        rds_source_username      = "<source-db-username>"
        rds_source_password      = "<source-db-password>"
        rds_target_username      = "<target-db-username>"
        rds_target_password      = "<target-db-password>"
        dbs_publicly_accessible  = false
        ec2_client_key_pair_name = "<keypair-name-for-ssh>"
        ec2_client_ssh_ip        = "<ip-in-cidr-for-ssh: 0.0.0.0/32>"
        ```
    2. Run Terraform command
        ```bash
        terraform apply -var-file=dev.tfvars
        ```
2. Populate source database
    1. SSH into EC2 client instance
        ```bash
        ssh -i <path-to-pem-file> ec2-user@<ec2-public-dns>
        ```
        See Terraform output for EC2 DNS
    2. Inside the instance, change directory into data repository
        ```bash
        cd aws-database-migration-samples/mysql/sampledb/v1/
        ```
    3. Run MySQL command to populate database
        ```bash
        mysql -h <mysql-endpoint> -P 3306 -u <username> -p<password> \
        dms_sample < ~/aws-database-migration-samples/mysql/sampledb/v1/install-rds.sql
        ```
        MySQL endpoint can be found in Terraform output. This command may take up to 45 minutes, as there is a lot of data to populate (8.5 GB).
