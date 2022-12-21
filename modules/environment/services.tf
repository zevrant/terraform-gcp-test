module hello_world {
  source = "../services/hello-world"

  context                             = var.context
  gcp_region                          = var.context.gcp_region
  sql_database_instance_ip            = module.db_instance_a.db_instance_ip_address
  sql_database_instance_name          = module.db_instance_a.db_instance_name
  sql_database_instance_root_password = module.db_instance_a.db_root_password
}