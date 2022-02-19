
variable "db_username" {
  type        = string
  description = "username for DB"
}

variable "db_password" {
  type        = string
  description = "password for DB"
}

variable "db_instance_class" {
  type        = string
  default     = "db.m5.large"
  description = "instance class for DB"
}

variable "db_allocated_storage" {
  type        = number
  default     = 20
  description = "allcated storage for instance (in Gb)"
}

variable "db_publicly_accessible" {
  type        = bool
  default     = false
  description = "whether db is publicly accessible"
}

variable "db_parameter_group" {
  type        = string
  description = "name of the parameter group for instance"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  default     = []
  description = "ids for security groups in vpc"
}

variable "db_subnet_ids" {
  type        = list(string)
  description = "list of subnet ids to put the database"
}

variable "db_az" {
  type        = string
  description = "availability zone for DB"
}
