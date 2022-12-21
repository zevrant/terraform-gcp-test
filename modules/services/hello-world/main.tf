module "auth-api-db" {
  source = "../../templates/database"

  microservice_name                   = "some-microservice-name"
  service_abbr                        = "abbrHere"
  context                             = var.context
  sql_database_instance_name          = var.sql_database_instance_name
  sql_database_instance_ip            = var.sql_database_instance_ip
  user_name                           = "datbase_name_here-sqlserver"
  sql_database_instance_root_password = var.sql_database_instance_root_password
  region                          = var.gcp_region
}