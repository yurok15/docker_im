resource "google_compute_network" "us1101" {
  name                    = "us1101"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "production-us-west1" {
  name          = "production-us-west1"
  ip_cidr_range = "172.20.0.0/21"
  network       = "${google_compute_network.us1101.self_link}"
  region        = "us-west1"
}

output "subnet_link_production-us-west1" {
  value = "${google_compute_subnetwork.production-us-west1.self_link}"
}
