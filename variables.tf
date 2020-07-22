variable "env" {}

variable "aws_access_key" {
  description = "aws_access_key"
  type        = string
}

variable "aws_secret_key" {
  description = "aws_secret_key"
  type        = string
}

variable "aws_region" {
  description = "aws_region"
  type        = string
  default     = "eu-west-2"
}

variable "app_name" {
  type = "string"
  description = "application name"
  default = ""
}

variable "ins_type" {
  type = "string"
  default = "t2.medium"
  description = "instance compute type/size"
}

variable "db_instance_endpoint" {
  type = "string"
  default = "t2.medium"
  description = "db instance endpoint "
}

variable "az_count" {
  type = "string"
  default = ""
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

variable "cms_environment" {
  type = "string"
  description = "cms environment like Dev, SysTest, SIT etc"
  default = ""
}

variable "app_hosted_zone" {
  type = "string"
  description =  "environment based app specific hosted zone"
  default = "cmsdemo.com"
}
variable "service_record_name" {
  type = "string"
  description =  "the prefix required for the zone to create the dns record"
  default = "cmsdev"
}
variable "elb_dns_name" {
  type = "string"
  description =  "elb_dns_name"
  default = ""
}
variable "elb_zone_id" {
  type = "string"
  description =  "elb hosted zone id"
  default = ""
}





