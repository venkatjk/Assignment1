
###################################################
#datasource for AMI
###################################################
data "aws_ami" "cms_linux" {
  filter {
    name = "name"
	  values = ["amzn2-ami-hvm-2.0.20200617.0-x86_64-gp2"]
  }
  owners           = ["137112412989"]
}

###################################################
#datasource for  security groups related to cms
###################################################
# data "aws_security_group" "cms_vpc_ec2_sg" {
#   filter {
#     name = "tag:Name"
#     values = ["cms-internal-ec2"]
#   }  
# }
# data "aws_security_group" "cms_vpc_lb_sg" {
#   filter {
#     name = "tag:Name"
#     values = ["cms-internal-elb"]
#   }
# }

###################################################
#datasource for autoscaling subnets
###################################################
data "aws_subnet" "cms_ec2" {
    #count = "${var.az_count}"
    count = 1
    filter {
      name = "tag:Name"
      values = ["cms${count.index + 1}"]
    }
}
###################################################
#datasource for elb subnets
###################################################
data "aws_subnet" "cms_elb" {
    #count = "${var.az_count}"
    count = 1
    filter {
      name = "tag:Name"
      values = ["cms${count.index + 1}"]
    }
}


#############################################################
#datasource for user data template
#############################################################

data "template_file" "user_data" {
  template = "${file("${path.module}/user_data.tpl")}"
  vars = {
    env = "${var.env}"
    user = "admin"
    password = "admin1234"
    endpoint = "${var.db_instance_endpoint}"
    dbname   = "cms"
  }
}

############################################
#resources
############################################
resource "aws_launch_configuration" "cms_server" {
  name_prefix = "${var.app_name}-${var.env}"
  image_id = "${data.aws_ami.cms_linux.image_id}"
  instance_type = "${var.ins_type}"
  key_name = "${var.admin_pwd_key}"
  # security_groups = [
  #   "${data.aws_security_group.cms_vpc_ec2_sg.id}"
  # ]
  security_groups = ["sg-0d38d2b2a156b3665"]
  user_data = "${data.template_file.user_data.rendered}"
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_group" "cms_asg" {
  name = "${aws_launch_configuration.cms_server.name}"
  max_size = "${var.asg_max_child}"
  min_size = "${var.asg_min_child}"
  health_check_grace_period = "1800"
  health_check_type = "EC2"
  wait_for_elb_capacity = "${var.asg_min_child}"
  wait_for_capacity_timeout = "${var.asg_capacity_timeout_mins}"
  launch_configuration = "${aws_launch_configuration.cms_server.name}"
  load_balancers = ["${aws_elb.cms_app_elb.id}"]
  #vpc_zone_identifier = ["${data.aws_subnet.cms_ec2.*.id}"]
  vpc_zone_identifier = ["subnet-66a2ea0f","subnet-7a8b5136"]
  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key = "Name"
    value = "${var.app_name}-${var.env}"
    propagate_at_launch = true
 }
 tag {
   key =  "env" 
   value = "${var.env}"
   propagate_at_launch = true
 }		
}

####################################
#classic elb
####################################
resource "aws_elb" "cms_app_elb" {
  name =  "${var.app_name}-lb-${var.env}" # 32 character limit 
  #security_groups = ["${data.aws_security_group.cms_vpc_lb_sg.id}"]
  security_groups = ["sg-0d38d2b2a156b3665"]
  #subnets = ["${data.aws_subnet.cms_elb.*.id}"]
  subnets = ["subnet-66a2ea0f","subnet-7a8b5136"]
  internal = "true"
  cross_zone_load_balancing = "true"
  idle_timeout = 3600
    listener  {
    instance_port = 80
    instance_protocol = "TCP"
    lb_port = 80
    lb_protocol = "TCP"
  }
  health_check {
    healthy_threshold = 3
    unhealthy_threshold = 5
    target = "TCP:80"
    interval = 10
    timeout = 5
  }
}
