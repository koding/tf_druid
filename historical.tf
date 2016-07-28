variable "historical_eb_port" {
  default = "8083"
}

module "druid_historical_eb" {
  source               = "./base_eb"
  app_name             = "${aws_elastic_beanstalk_application.druid.name}"
  env_name             = "druid-historical"
  eb_security_groups   = "${module.druid_historical_sg.aws_security_group_eb_id}"
  elb_security_groups  = "${module.druid_historical_sg.aws_security_group_elb_id}"
  eb_port              = "${var.historical_eb_port}"
  elb_port             = "${var.historical_eb_port}"
  healthCheckEndpoint  = "HTTP:${var.historical_eb_port}/status"
}


module "druid_historical_sg" {
  source                    = "./base_sg"
  name                      = "druid-historical"
  eb_port                   = "${var.historical_eb_port}"
  zk_elb_sec_group_id       = "${var.zk_elb_sec_group_id}"
}
