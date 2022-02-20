
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.59.0"
    }
  }

  required_version = "~> 1.0.0"
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "vpc" {
  source                  = "./modules/vpc"
  aws_region              = var.aws_region
  dbs_publicly_accessible = var.dbs_publicly_accessible
}

module "rds_param_groups" {
  source = "./modules/rds-parameter-groups"
}

module "rds_source_db" {
  source                 = "./modules/rds-source-db"
  db_parameter_group     = module.rds_param_groups.mysql_param_group
  db_az                  = module.vpc.azs[0]
  db_subnet_group_name   = module.vpc.db_subnet_group_name
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  db_subnet_ids          = var.dbs_publicly_accessible ? module.vpc.public_subnet_ids : module.vpc.private_subnet_ids
  db_username            = var.rds_source_username
  db_password            = var.rds_source_password
  db_publicly_accessible = var.dbs_publicly_accessible

  depends_on = [
    module.vpc
  ]
}

module "rds_target_db" {
  source                 = "./modules/rds-target-db"
  db_parameter_group     = module.rds_param_groups.postgres_param_group
  db_az                  = module.vpc.azs[1]
  db_subnet_group_name   = module.vpc.db_subnet_group_name
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  db_subnet_ids          = var.dbs_publicly_accessible ? module.vpc.public_subnet_ids : module.vpc.private_subnet_ids
  db_username            = var.rds_target_username
  db_password            = var.rds_target_password
  db_publicly_accessible = var.dbs_publicly_accessible

  depends_on = [
    module.vpc
  ]
}

module "ec2_client" {
  source            = "./modules/ec2-client"
  vpc_id            = module.vpc.vpc_id
  vpc_default_sg_id = module.vpc.default_security_group_id
  subnet_id         = module.vpc.public_subnet_ids[0]
  key_pair_name     = var.ec2_client_key_pair_name
  my_ip_for_ssh     = var.ec2_client_ssh_ip
}

