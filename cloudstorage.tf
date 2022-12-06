resource "google_storage_bucket" "cloud-storage-primary" {
  #"${var.cloud_storage_name}-${var.application_name}-${var.environement}"
  name                        = var.cloud_storage_name
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type          = "SetStorageClass"
      storage_class = "REGIONAL"
    }
  }
  versioning {
    enabled = var.versioning
  }
}