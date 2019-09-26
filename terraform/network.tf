resource "google_compute_network" "nginx-network" {
  name                    = "nginx-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "us-central1-nginx" {
  name          = "us-central1-network"
  ip_cidr_range = "192.168.0.0/24"
  region        = "us-central1"
  network       = "${google_compute_network.nginx-network.self_link}"
}

resource "google_compute_firewall" "public-resource-rule" {
  name    = "public-resource-rule"
  network = "${google_compute_network.nginx-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["176.37.52.205/32", "192.168.0.0/24"]

  target_tags = ["nginx"]
}

resource "google_compute_firewall" "ssh-rule" {
  name    = "ssh-rule"
  network = "${google_compute_network.nginx-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["176.37.52.205/32", "0.0.0.0/0"]

  target_tags = ["nginx"]
}

resource "google_compute_firewall" "connect-rule" {
  name    = "connect-rule"
  network = "${google_compute_network.nginx-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["176.37.52.205/32", "192.168.0.0/24"]

  target_tags = ["nginx"]
}
