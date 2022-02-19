
variable "aws_profile" {
  type = string
  default = "default"
  description = "AWS profile to use to bring up infrastructure"
}

variable "aws_region" {
  type = string
  default = "us-west-2"
  description = "AWS region for infrastructure deployment"
}
