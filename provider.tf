provider "google" {
  project     = var.project_id
  # credentials = local.credentials
  credentials = var.credentials
}