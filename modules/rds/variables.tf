variable "env" {}

variable "allocated_storage" {
  description = "allocated_storagee"
  type        = string
  default     = "20"
}

variable "publicly_accessible" {
  description = "publicly_accessible"
  type        = bool
  default     = true
}

variable "engine" {
  description = "my sql engine"
  type        = string
  default     = "mysql"
}
variable "enginever" {
  description = "my sql engine version"
  type        = string
  default     = "8.0.17"
}
variable "instance_class" {
  description = "instance class"
  type        = string
  default     = "db.t2.micro"
}

variable "dbname" {
  description = "datbasename"
  type        = string
  default     = "wordpress"
}

variable "dbuname" {
  description = "dbuname"
  type        = string
  default     = "admin"
}
variable "dbpassword" {
  description = "dbpassword"
  type        = string
  default     = "admin1234"
}
variable "parameter_group_name" {
  description = "parameter_group_name"
  type        = string
  default     = "default.mysql8.0"
}

variable "storage_type" {
  description = "storage_type"
  type        = string
  default     = "gp2"
}

variable "security_group_id" {
  description = "security_group_id"
  type        = string
  default     = "sg-497df82b"
}


