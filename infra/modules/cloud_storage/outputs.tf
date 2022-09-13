output "cloud_storage_bucket_name" {
  value       = google_storage_bucket.tf-state.name
  description = "Terraform state storage bucket name"
}
