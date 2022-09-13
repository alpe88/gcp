terraform {
  required_version = ">= 0.14"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.35.0"
    }
  }

  backend "gcs" {
    bucket = "test-project-362121-tfstate"
    prefix = "env/dev"
  }
}

module "service_account" {
  source = "./modules/service_account"

  project_name           = var.project_name
  service_account_prefix = local.project_env_name_shortened
  roles = [
    "roles/editor",
    "roles/iam.serviceAccountTokenCreator"
  ]
  token_creators = var.admin_users
}

data "google_service_account_access_token" "sa" {
  provider               = google.tokengen
  target_service_account = module.service_account.service_account_user_email
  lifetime               = local.lifetime
  scopes                 = local.service_account_scopes
}

provider "google-beta" {
  access_token = data.google_service_account_access_token.sa.access_token
  region       = var.region
}

module "firebase_project" {
  source = "./modules/firebase-project"

  project_name         = local.project_env_name_shortened
  firebase_admin_users = var.admin_users
}

module "firebase_db" {
  source = "./modules/firestore-db"

  firebase_project_id  = module.firebase_project.firebase_project.id
  location             = module.firebase_project.firebase_project.location
  firebase_admin_users = var.admin_users
}


module "firebase_web_app" {
  source = "./modules/firebase-web-app"

  project_name              = local.project_env_name_shortened
  firebase_project_id       = module.firebase_project.firebase_project.id
  firebase_config_file_path = "./app/src/environments/environment.ts"
}
