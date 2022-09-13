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
  for_each = toset(var.roles)
  role     = each.key
  member   = "serviceAccount:${google_service_account.sa-name.email}"
  project  = var.project_name
}

resource "google_service_account_iam_binding" "token-creator-iam" {
  service_account_id = "projects/-/serviceAccounts/${google_service_account.sa-name.email}"
  role               = local.token_creator_role
  for_each           = toset(var.token_creators)
  members = [
    "user:${each.value}",
  ]
}
