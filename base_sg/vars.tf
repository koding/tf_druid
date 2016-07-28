variable "aws_security_group_prefix" {
  default = "sec-group-"
}

variable "name" {
  default = "druid"
}

variable "vpc_id" {
  default = "vpc-54a53133"
}


variable eb_port {}
variable zk_elb_sec_group_id {}
