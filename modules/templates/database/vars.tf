variable context {
  type = object({
    gcp_project_id     = string
    gcp_psa_project_id = string
    environment        = string
  })
}

variable "region" {
  type        = string
  description = "The region of the Cloud SQL resources"
  default     = "us-central1"
}

variable "db_charset" {
  description = "The charset for the default database"
  type        = string
  default     = ""
}

variable "db_collation" {
  description = "The collation for the default database. Example: 'en_US.UTF8'"
  type        = string
  default     = ""
}

variable "default_schema" {
  description = "The default schema for the database per environment. Example: 'dbo'"
  type        = map(string)
  default     = {
    "qa"      = "dbo"
    "e2e"     = "dbo"
    "sandbox" = "dbo"
    "dev"     = "dbo"
    "stage"   = "dbo"
    "prod"    = "dbo"
  }
}

variable "microservice_name" {
  description = "The name of the microservice associated with the database"
  type        = string
}

variable "password_secret_expiration" {
  description = "The expiration date and time for the DB instance password secret"
  type        = string
  default     = "2024-04-12T20:16:13Z"
}

variable "service_abbr" {
  description = "The four letter abbreviated name of the service associated with the DB secrets"
  type        = string
}

variable "sql_database_instance_name" {
  description = "The google sql database instance of the database"
  type        = string
}

variable "sql_database_instance_ip" {
  description = "The google sql database ip address associated with the instance"
  type        = string
}

variable "sql_database_instance_root_password" {
  description = "The root password of the google sql database instance"
  type        = string
}

variable "url_secret_expiration" {
  description = "The expiration date and time for the jdbc connection string secret"
  type        = string
  default     = "2024-04-12T20:16:13Z"
}

variable "username_secret_expiration" {
  description = "The expiration date and time for the DB instance username secret"
  type        = string
  default     = "2024-04-12T20:16:13Z"
}

variable "user_name" {
  description = "The name of the default user"
  type        = string
}

variable "user_password" {
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
  type        = string
  default     = null
}