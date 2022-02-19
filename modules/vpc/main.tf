
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.7.0"

  name                 = "DMSVPC"
  cidr                 = "10.0.0.0/16"
  azs                  = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnets       = ["10.0.1.0/24"]
  private_subnets      = ["10.0.2.0/24"]
  enable_dns_hostnames = true
  enable_nat_gateway   = false
}

resource "aws_security_group_rule" "mysql_inbound" {
  type = "ingress"
  protocol = "tcp"
  from_port = 3306
  to_port = 3306
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpc.default_security_group_id
}

resource "aws_security_group_rule" "postgres_inbound" {
  type = "ingress"
  protocol = "tcp"
  from_port = 5432
  to_port = 5432
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpc.default_security_group_id
}
