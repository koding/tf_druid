variable "realtime_eb_port" {
  default = "8084"
}

module "druid_realtime_eb" {
  source               = "./base_eb"
  app_name             = "${aws_elastic_beanstalk_application.druid.name}"
  env_name             = "druid-realtime"
  eb_security_groups   = "${module.druid_realtime_sg.aws_security_group_eb_id}"
  elb_security_groups  = "${module.druid_realtime_sg.aws_security_group_elb_id}"
  eb_port              = "${var.realtime_eb_port}"
  elb_port             = "${var.realtime_eb_port}"
  healthCheckEndpoint  = "HTTP:${var.realtime_eb_port}/status"
}


module "druid_realtime_sg" {
  source                    = "./base_sg"
  name                      = "druid-realtime"
  eb_port                   = "${var.realtime_eb_port}"
}
