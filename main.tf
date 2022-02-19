
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
  source     = "./modules/vpc"
  aws_region = var.aws_region
}

module "rds_param_groups" {
  source = "./modules/rds-parameter-groups"
}

module "rds_source_db" {
  source                 = "./modules/rds-source-db"
  db_parameter_group     = module.rds_param_groups.mysql_param_group
  db_az                  = module.vpc.azs[0]
  db_subnet_ids          = var.rds_source_publicly_accessible ? module.vpc.public_subnet_ids : module.vpc.private_subnet_ids
  vpc_security_group_ids = [module.vpc.db_security_group_id]
  db_username            = var.rds_source_username
  db_password            = var.rds_source_password
}
