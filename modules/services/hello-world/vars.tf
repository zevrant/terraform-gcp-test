variable context {
  type = object({
    gcp_project_id     = string
    gcp_psa_project_id = string
    environment        = string
  })
}

variable sql_database_instance_name {
  type = string
}

variable sql_database_instance_ip {
  type = string
}

variable sql_database_instance_root_password {
  type = string
}

variable gcp_region {
  type = string
}