resource "google_compute_network" "nginx-network" {
  name                    = "nginx-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "us-central1-nginx" {
  name          = "us-central1-network"
  ip_cidr_range = "${var.subnet_cidr}"
  region        = "${var.region}"
  network       = "${google_compute_network.nginx-network.self_link}"
}

resource "google_compute_firewall" "public-resource-rule" {
  name    = "public-resource-rule"
  network = "${google_compute_network.nginx-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = "${var.sources}"

  target_tags = ["${var.app_name}"]
}

// Change var.app_name to 0.0.0.0/0 to make online SSh session work (because Google IP's dynamic)
resource "google_compute_firewall" "ssh-rule" {
  name    = "ssh-rule"
  network = "${google_compute_network.nginx-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = "${var.ssh-sources}"

  target_tags = ["${var.app_name}"]
}

// Needed for online SSH session
resource "google_compute_firewall" "connect-rule" {
  name    = "connect-rule"
  network = "${google_compute_network.nginx-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = "${var.sources}"

  target_tags = ["${var.app_name}"]
}
