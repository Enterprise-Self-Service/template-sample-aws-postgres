
variable "identifier" {
  type = string
}

variable "storagetype" {
  type    = string
  default = "io1"
}

variable "storagesize" {
  type    = string
  default = 200
}

variable "max_allocated_storage" {
  type    = string
  default = 2000
}

variable "iops" {
  type    = string
  default = 3000
}

variable "storage_encrypted" {
  type    = bool
  default = true
}

variable "engine_version" {
  type    = string
  default = "15.3"
}

variable "instance_class" {
  type    = string
  default = "db.t3.small"
}

variable "db_name" {
  type = string
}

variable "administrator_username" {
  type    = string
  default = "administrator"
}

variable "backup_retention_period" {
  type    = string
  default = 7
}

variable "monitoring_interval" {
  type    = string
  default = 0
}

variable "db_parameter_group" {
  type    = string
  default = "postgres15"
}

variable "vpc_name" {
  type    = string
  default = "*"
}