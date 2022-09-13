resource "random_id" "id" {
  byte_length = local.byte_length
  prefix      = "${var.service_account_prefix}-"
}

resource "google_service_account" "sa-name" {
  project      = var.project_name
  account_id   = random_id.id.hex
  display_name = "Service Account for the In-App Chat Service of the Communications Platform"
}

resource "google_project_iam_member" "project" {
  project = var.project_name
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.sa-name.email}"
}
