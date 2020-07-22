######################################################
# outputs section
######################################################
output "cms_dns_name"  { value = "${aws_route53_record.cms_dns.name}" }