terraform {
  backend "gcs" {
    prefix = "gcp/sre-sandbox-184620/global"
    bucket = "tango-terraform-testing"
  }
}
