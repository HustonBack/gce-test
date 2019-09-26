resource "google_compute_instance" "nginx" {
  name         = "${var.app_name}"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["test", "${var.app_name}"]

  boot_disk {
    initialize_params {
      image = "${data.google_compute_image.nginx-image.self_link}"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.us-central1-nginx.name}"

    access_config {}
  }
}
