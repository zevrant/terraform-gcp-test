variable context {
  type = object({
    gcp_project_id     = string
    gcp_psa_project_id = string
    gcp_region         = string
    environment        = string
  })
}