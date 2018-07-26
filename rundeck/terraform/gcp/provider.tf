// Configure the Google Cloud provider
provider "google" {
  project = "${var.PROJECT}"
  region  = "${var.REGION}"
}
