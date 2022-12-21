variable context {
  type = object({
    environment        = string
    gcp_project_id     = string
    gcp_psa_project_id = string
    gcp_region         = string
  })
}
variable "database_flags" {
  description = "The database flags for the master instance. See [more details](https://cloud.google.com/sql/docs/sqlserver/flags)"
  type        = list(object({
    name  = string
    value = string
  }))
}

variable "database_version" {
  type        = string
  description = "The database version to use: SQLSERVER_2017_STANDARD, SQLSERVER_2017_ENTERPRISE, SQLSERVER_2017_EXPRESS, or SQLSERVER_2017_WEB"
}

variable db_activation_policy {
  type = string
}

variable db_deletion_protection {
  type = bool
  description = "enable deletion protection when true"
  default = true
}

variable "db_disk_size" {
  description = "The root password of this database instance"
  type        = string
}

variable "db_disk_type" {
  description = "The root password of this database instance"
  type        = string
}

variable db_maintenance_window_update_track {
  type = string
  default = "canary"
}

variable db_maintenance_window_day {
  type = number
  default = 1
}

variable db_maintenance_window_hour{
  type = number
  default = 2
}

variable db_encryption_key_name {
  type = string
  description = "name of encryption key to use to encrypt the database instance"
}

variable "db_instance_name" {
  description = "The name of this database instance"
  type        = string
}

variable "db_pricing_plan" {
  description = "The root password of this database instance"
  type        = string
}

variable "db_tier" {
  description = "The tier of this database instance"
  type        = string
}

variable db_zone {

}