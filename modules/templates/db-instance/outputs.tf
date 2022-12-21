output "db_root_password" {
  value = google_sql_database_instance.default.root_password
}

output "db_instance_name" {
  value = google_sql_database_instance.default.name
}

output "db_instance_ip_address" {
  value = google_sql_database_instance.default.ip_address.0.ip_address
}
