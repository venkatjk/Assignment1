output "db_instance_endpoint"  { 
    value = "${module.rds.db_instance_endpoint}" 
    }

output "elb_dns_name"  { 
    value = "${module.cms_asg.cms_elb_dns_name}" 
    }

output "elb_zone_id"  { 
    value = "${module.cms_asg.cms_elb_zone_id}" 
    }

output "cms_dns_name"  { 
    value = "${module.r53_dns.cms_dns_name}" 
    }

