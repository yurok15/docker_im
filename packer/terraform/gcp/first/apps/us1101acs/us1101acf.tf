provider "google" {
  credentials = "${file("account.json")}"
  project     = "85778554611"
  region      = "us-central1"
}
// Create a new instance
resource "google_compute_instance" "default" {
  name = "test"
  machine_type = "n1-standard-1"
  zone = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
    }
  }

  network_interface {
    network = "default"

  access_config {
      // Ephemeral IP
    }
  }
}
