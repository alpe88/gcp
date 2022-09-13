resource "random_id" "bucket_prefix" {
  byte_length = local.byte_length
  prefix      = "${var.service_account_prefix}-"
}

resource "google_storage_bucket" "tf-state" {
  name          = "${random_id.bucket_prefix.hex}-bucket-tfstate"
  force_destroy = false
  location      = "US"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}
