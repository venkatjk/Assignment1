
#####################################################
#datasource for app specific hosted zone
#####################################################
data "aws_route53_zone" "cms_dns" {
  name = "${var.app_hosted_zone}"
  private_zone = true
}
#####################################################
#resources
#####################################################
resource "aws_route53_record" "cms_dns" {
  zone_id =  "${data.aws_route53_zone.cms_dns.zone_id}"
  name =  "${var.service_record_name}.${data.aws_route53_zone.cms_dns.name}"
  type = "A"
  alias {
    name = "${var.elb_dns_name}"
    zone_id = "${var.elb_zone_id}"
    evaluate_target_health = true
  }
}
