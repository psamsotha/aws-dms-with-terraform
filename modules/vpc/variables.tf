
variable "aws_region" {
  type        = string
  description = "AWS region for VPC"
}

variable "dbs_publicly_accessible" {
  type        = bool
  description = "whether the dbs in public subnet group"
}
