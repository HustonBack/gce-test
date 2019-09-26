resource "google_compute_instance" "nginx" {
  name         = "nginx"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["test", "nginx"]

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
