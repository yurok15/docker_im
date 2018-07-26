resource "google_storage_bucket" "cs-tangome-generic" {
  name          = "cs-tangome-generic"
  location      = "us-west1"
  storage_class = "REGIONAL"

  versioning = {
    enabled = false
  }

  labels = {
    "description" = "this_is_a_test_bucket_for_terraform_testing"
    "application" = "contentserver"
    "owner"       = "vakimov"
  }

  logging = {
    log_bucket        = "statistic-report-sre"
    log_object_prefix = "cs-tangome-generic_"
  }
}

resource "google_storage_bucket" "statistic-report-sre" {
  name          = "statistic-report-sre"
  location      = "us-west1"
  storage_class = "REGIONAL"

  versioning = {
    enabled = false
  }

  logging = {
    log_bucket        = "statistic-report-sre"
    log_object_prefix = "statistic-report_"
  }

  labels = {
    "application" = "rundeck"
    "owner"       = "vakimov"
  }
}

resource "google_storage_bucket_acl" "statistic-report-acl" {
  bucket = "${google_storage_bucket.statistic-report-sre.name}"

  role_entity = [
    "WRITER:group-cloud-storage-analytics@google.com",
  ]
}
