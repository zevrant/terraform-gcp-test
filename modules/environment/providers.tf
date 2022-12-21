provider "google" {
  project = var.context.gcp_project_id
  region  = var.context.gcp_region
}

terraform {
  required_providers {
    random = {
      source = "random"
    }
  }
}