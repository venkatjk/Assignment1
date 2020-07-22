#---------------------------------------------------------
# variables
#---------------------------------------------------------
variable "aws_region" {
  type = "string"
  description = "the aws region"
  default = "eu-west-1"
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
variable "env"{
  type = "string"
  description = "The Type of enviroment dev,uat,sit,prod"
  default = ""
}


