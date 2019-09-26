provider "google" {
  credentials = "${file("/etc/creds/admin.json")}"
  project     = "forward-cab-254117"
  region      = "${var.region}"
}
