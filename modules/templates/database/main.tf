resource "google_sql_database" "default" {
  name       = "${var.microservice_name}-${var.context.environment}"
  project    = var.context.gcp_psa_project_id
  instance   = var.sql_database_instance_name
  charset    = var.db_charset
  collation  = var.db_collation
  depends_on = [google_sql_user.default, google_sql_user.flyway]
}

resource "google_sql_user" "default" {
  name     = var.user_name
  project  = var.context.gcp_psa_project_id
  instance = var.sql_database_instance_name
  password = coalesce(var.user_password, random_password.user-password.result)
}

resource "google_sql_user" "support" {
  name     = "${var.user_name}-support"
  project  = var.context.gcp_psa_project_id
  instance = var.sql_database_instance_name
  password = random_password.support-user-password.result
}

resource "google_sql_user" "flyway" {
  name     = "${var.user_name}-flyway"
  project  = var.context.gcp_psa_project_id
  instance = var.sql_database_instance_name
  password = random_password.flyway-user-password.result
}

resource "random_password" "support-user-password" {
  length  = 18
  special = true
  override_special = "!@#%&*()-_=+[]<>:?"
}

resource "random_password" "user-password" {
  length  = 18
  special = true
  override_special = "!@#%&*()-_=+[]<>:?"
}

resource "random_password" "flyway-user-password" {
  length  = 18
  special = true
  override_special = "!@#%&*()-_=+[]<>:?"
}
