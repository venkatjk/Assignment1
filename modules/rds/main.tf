resource "aws_db_instance" "mysql" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.enginever
  instance_class       = var.instance_class
  name                 = var.dbname
  username             = var.dbuname
  password             = var.dbpassword
  parameter_group_name = var.parameter_group_name
  publicly_accessible  = var.publicly_accessible
  vpc_security_group_ids = ["sg-497df82b"]
}

data "aws_security_group" "selected" {
  id = "${var.security_group_id}"
}

