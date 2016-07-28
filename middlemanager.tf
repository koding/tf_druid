variable "middlemanager_eb_port" {
  default = "8090"
}

module "druid_middlemanager_eb" {
  source               = "./base_eb"
  app_name             = "${aws_elastic_beanstalk_application.druid.name}"
  env_name             = "druid-middlemanager"
  eb_security_groups   = "${module.druid_middlemanager_sg.aws_security_group_eb_id}"
  elb_security_groups  = "${module.druid_middlemanager_sg.aws_security_group_elb_id}"
  eb_port              = "${var.middlemanager_eb_port}"
  elb_port             = "${var.middlemanager_eb_port}"
  healthCheckEndpoint  = "HTTP:${var.middlemanager_eb_port}/status"
}


module "druid_middlemanager_sg" {
  source                     = "./base_sg"
  name                       = "druid-middlemanager"
  eb_port                    = "${var.middlemanager_eb_port}"
}
