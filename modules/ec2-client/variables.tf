
variable "vpc_id" {
  type        = string
  description = "ID of the VPC to put the instance"
}

variable "vpc_default_sg_id" {
  type        = string
  description = "default security group ID of VPC"
}

variable "my_ip_for_ssh" {
  type        = string
  description = "Your IP to allow for SSH access"
}

variable "key_pair_name" {
  type        = string
  description = "key pair name for SSH access"
}

variable "subnet_id" {
  type        = string
  description = "ID of subnet to put instance"
}