locals {
  start_time        = random_integer.backup_hour.result % 24
  start_time_string = local.start_time < 10 ? "0${tostring(local.start_time)}:00" : "${tostring(local.start_time)}:00"
}

resource "google_sql_database_instance" "default" {
  provider            = google-beta
  project             = var.context.gcp_psa_project_id
  name                = "${var.context.environment}-${var.db_instance_name}-${var.context.gcp_region}"
  database_version    = var.database_version
  region              = var.context.gcp_region
  encryption_key_name = var.db_encryption_key_name
  root_password       = random_password.db-root-password.result
  deletion_protection = var.db_deletion_protection
  settings {
    tier              = var.db_tier
    activation_policy = var.db_activation_policy

    backup_configuration {
      binary_log_enabled             = false
      enabled                        = true
      start_time                     = local.start_time_string
      point_in_time_recovery_enabled = false
      transaction_log_retention_days = "7"

      backup_retention_settings {
        retained_backups = 49
        retention_unit   = "COUNT"
      }
    }

    ip_configuration {
        ipv4_enabled    = false
        require_ssl     = true
    }

    disk_autoresize = true
    disk_size       = var.db_disk_size
    disk_type       = var.db_disk_type
    pricing_plan    = var.db_pricing_plan
    dynamic "database_flags" {
      for_each = var.database_flags
      content {
        name  = lookup(database_flags.value, "name", null)
        value = lookup(database_flags.value, "value", null)
      }
    }

    location_preference {
      zone = var.db_zone
    }

    maintenance_window {
      day          = var.db_maintenance_window_day
      hour         = var.db_maintenance_window_hour
      update_track = var.db_maintenance_window_update_track
    }
  }

  lifecycle {
    ignore_changes = [
      settings[0].disk_size
    ]
  }
}

resource "random_integer" "backup_hour" {
  max = 28
  min = 23
}

resource "random_password" "db-root-password" {
  length  = 18
  special = true
}

