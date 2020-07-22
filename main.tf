#######################################
#Module RDS
#######################################
module "rds" {
  source                                        = "./modules/rds"
  #aws_access_key                                = "${var.aws_access_key}"
  #aws_secret_key                                = "${var.aws_secret_key}"
  env                                            = "${var.env}"
  }

########################################
#Module Asg
########################################
module  cms_asg {
source = "./modules/asg"
aws_region = "${var.aws_region}"
ins_type = "${var.ins_type}"
asg_min_child = "${var.asg_min_child}"
asg_max_child = "${var.asg_max_child}"
asg_capacity_timeout_mins = "${var.asg_capacity_timeout_mins}"
az_count = "${var.az_count}"
env = "${var.env}"
db_instance_endpoint = "${module.rds.db_instance_endpoint}"
}


#######################################
#Module DNS
#######################################
module r53_dns {
source = "./modules/dns"
aws_region = "${var.aws_region}"
app_hosted_zone = "${var.app_hosted_zone}"
service_record_name =  "${var.service_record_name}"
elb_dns_name = "${module.cms_asg.cms_elb_dns_name}"
elb_zone_id = "${module.cms_asg.cms_elb_zone_id}"
}