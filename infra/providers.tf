provider "google" {
  alias   = "tokengen"
  region  = var.region
  project = var.project_name
}
