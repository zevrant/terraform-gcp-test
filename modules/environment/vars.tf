variable context {
  type = object({
    gcp_project_id     = string
    gcp_psa_project_id = string
    environment        = string
    gcp_region         = string
  })
}