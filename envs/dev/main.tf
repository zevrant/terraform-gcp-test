terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket"  # the backend is stored in a bucket in the common project not in primary project or psa project
    prefix = "dev/"
  }
}

module "dev"{
  source = "../../modules/environment"
  context = var.context
}