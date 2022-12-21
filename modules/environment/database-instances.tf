module db_instance_a {
  source = "../templates/db-instance"
  context          = var.context
  database_flags   = [
    {
      name  = "contained database authentication"
      value = "on"
    }
  ]
  database_version = "SQLSERVER_2019_ENTERPRISE"
  db_disk_size     = 10
  db_disk_type     = "PD_SSD"
  db_instance_name = "db-instance-a"
  db_pricing_plan  = "PER_USE"
  db_tier          = "db-custom-4-8192"
  db_activation_policy = "ALWAYS"
  db_encryption_key_name = null
  db_zone = "us-central-1a"
}