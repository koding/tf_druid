variable "env_name" {
  default = "koding-druid"
}

variable "app_name" {
  default = "koding-druid"
}

variable "solution_stack_name" {
  default = "64bit Amazon Linux 2016.03 v2.1.2 running PHP 5.6"
}

variable "key_pair_name" {
  default = "key-koding-eb-deployment-dev"
}

variable "iaminstanceprofile" {
  default = "aws-elasticbeanstalk-ec2-role"
}

variable "zk_hosts" {
  default = "localhost:2181/kafka"
}

variable "ami_id" {
  default = "ami-1fdd4a08"
}

variable "instance_type" {
  default = "c3.2xlarge"
}

variable "vpc_id" {
  default = "vpc-54a53133"
}

variable "vpc_subnets" {
  default = "subnet-2a2e1b00,subnet-f4dbefac"
}

variable "elb_subnet_ids" {
  default = "subnet-2a2e1b00,subnet-f4dbefac"
}

variable "healthCheckEndpoint" {
  default = "HTTP:80/"
}

variable "deployment_type" {
  description = "Choose a deployment policy for application version deployments. (AllAtOnce, Rolling, RollingWithAdditionalBatch, Immutable)"
  default     = "Rolling"
}

variable "deployment_command_timeout" {
  description = "Number of seconds to wait for an instance to complete executing commands. (1 to 3600)"
  default     = "600"
}

variable "deployment_batch_size_type" {
  description = "The type of number that is specified in BatchSize. (Percentage, Fixed)"
  default     = "Fixed"
}

variable "deployment_batch_size" {
  description = " Percentage or fixed number of Amazon EC2 instances in the Auto Scaling group on which to simultaneously perform deployments. Valid values vary per BatchSizeType setting. (1 to 100 (Percentage). 1 to aws:autoscaling:asg::MaxSize (Fixed))"
  default     = "1"
}

variable "service_role_name" {
  description = "The name of an IAM role that Elastic Beanstalk uses to manage resources for the environment."
  default     = "aws-elasticbeanstalk-service-role"
}

# Instance Settings
variable "ec2_key_name" {
  default = "ec2_key"
}

variable "aws_security_group_prefix" {
  default = "sec-group-"
}

variable "eb_port" {
  default = "8082"
}

variable "elb_port" {
  default = "8082"
}

variable elb_security_groups {}
variable eb_security_groups {}
