variable "coordinator_eb_port" {
  default = "8081"
}

module "druid_coordinator_eb" {
  source               = "./base_eb"
  app_name             = "${aws_elastic_beanstalk_application.druid.name}"
  env_name             = "druid-coordinator"
  eb_security_groups   = "${module.druid_coordinator_sg.aws_security_group_eb_id}"
  elb_security_groups  = "${module.druid_coordinator_sg.aws_security_group_elb_id}"
  eb_port              = "${var.coordinator_eb_port}"
  elb_port             = "${var.coordinator_eb_port}"
  healthCheckEndpoint  = "HTTP:${var.coordinator_eb_port}/status"
}


module "druid_coordinator_sg" {
  source                    = "./base_sg"
  name                      = "druid-coordinator"
  eb_port                   = "${var.coordinator_eb_port}"
  zk_elb_sec_group_id       = "${var.zk_elb_sec_group_id}"
}
