######################################################
# outputs section
######################################################
output "db_instance_endpoint"  { 
    value = "${aws_db_instance.mysql.address}" 
    }