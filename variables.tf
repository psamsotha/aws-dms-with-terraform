
variable "aws_profile" {
  type        = string
  default     = "default"
  description = "AWS profile to use to bring up infrastructure"
}

variable "aws_region" {
  type        = string
  default     = "us-west-2"
  description = "AWS region for infrastructure deployment"
}

variable "rds_source_username" {
  type        = string
  description = "username for DB"
}

variable "rds_source_password" {
  type        = string
  description = "password for DB"
}

variable "rds_source_instance_class" {
  type        = string
  default     = "db.m5.large"
  description = "instance class for DB"
}

variable "rds_source_publicly_accessible" {
  type        = bool
  default     = false
  description = "whether db is publicly accessible"
}

variable "rds_target_username" {
  type        = string
  description = "username for DB"
}

variable "rds_target_password" {
  type        = string
  description = "password for DB"
}

variable "rds_target_instance_class" {
  type        = string
  default     = "db.m5.large"
  description = "instance class for DB"
}

variable "rds_target_publicly_accessible" {
  type        = bool
  default     = false
  description = "whether db is publicly accessible"
}
