################################
#outputs
################################
output "cms_elb_dns_name" {
  value = "${aws_elb.cms_app_elb.dns_name}" 
}
output "cms_elb_zone_id" {
  value = "${aws_elb.cms_app_elb.zone_id}" 
}