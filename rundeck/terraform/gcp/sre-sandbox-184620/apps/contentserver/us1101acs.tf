resource "google_compute_instance" "us1101acs" {
  name         = "${format("us1101-test-acs%03d", count.index + 1)}"
  count        = 1
  machine_type = "f1-micro"
  zone         = "us-west1-b"

  boot_disk {
    initialize_params {
      image = "tangome-production/tango-centos-65-minimal-google-addons"
      size  = 30
    }
  }

  network_interface {
//    subnetwork = "${data.terraform_remote_state.global.subnet_link_production-us-west1}"

    access_config {
      // Ephemeral IP
    }
  }

  labels = {
    terraform = "true"
    owner     = "rvrublevskiy"
  }
}
