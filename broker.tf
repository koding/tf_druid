variable "broker_eb_port" {
  default = "8082"
}

module "druid_broker_eb" {
  source               = "./base_eb"
  app_name             = "${aws_elastic_beanstalk_application.druid.name}"
  env_name             = "druid-broker"
  eb_security_groups   = "${module.druid_broker_sg.aws_security_group_eb_id}"
  elb_security_groups  = "${module.druid_broker_sg.aws_security_group_elb_id}"
  eb_port              = "${var.broker_eb_port}"
  elb_port             = "${var.broker_eb_port}"
  healthCheckEndpoint  = "HTTP:${var.broker_eb_port}/status"
}


module "druid_broker_sg" {
  source                    = "./base_sg"
  name                      = "druid-broker"
  eb_port                   = "${var.broker_eb_port}"
  zk_elb_sec_group_id       = "${var.zk_elb_sec_group_id}"
}
