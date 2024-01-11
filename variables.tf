
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
  type    = number
  default = 500
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
  default = "db.t2"
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
  default = 60
}

variable "db_parameter_group" {
  type    = string
  default = "postgres15"
}