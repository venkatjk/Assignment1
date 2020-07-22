#variable "access_key" {}
#variable "secret_key" {}

variable "aws_region" {
  type = "string"
  description = "the aws region"
  default = "eu-west-1"
}

variable "app_name" {
  type = "string"
  description = "application name"
  default = "cms"
}

variable "ins_type" {
  type = "string"
  default = "t2.medium"
  description = "instance compute type/size"
}

variable "db_instance_endpoint" {
  #type = "string"
  default = ""
  description = "db instance endpoint "
}

variable "az_count" {
  type = "string"
  default = "2"
  description = "availability zone count"
}
variable "asg_max_child" {
  type= "string"
  description = "max no. of instances"
  default = "2"
}
variable "asg_min_child" {
  type= "string"
  description = "min no. of instances"
  default = "1"
}
variable "asg_capacity_timeout_mins"{
  type= "string"
  default= "20m"
  description = "time in minutes before ASG creation times out"
}

variable "env"{
  type = "string"
  description = "The Type of enviroment dev,uat,sit,prod"
  default = ""
}
variable "cms_environment" {
  type = "string"
  description = "cms environment like Dev, SysTest, SIT etc"
  default = ""
}

variable "admin_pwd_key" {
  type = "string"
  description = "cms admin key"
  default = "wordpress"
}

#########################################################
# variables for template
#########################################################

