locals {
  service_account_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  lifetime               = "600s"

  project_env_name_shortened = length(var.project_name) > 4 ? "${substr(var.project_name, 0, 4)}-${var.env}" : "${var.project_name}-${var.env}"
}
