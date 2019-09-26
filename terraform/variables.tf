variable "sources" {
  default = ["176.37.52.0/24", "194.183.168.0/24"]
}

variable "ssh-sources" {
  # Uncomment to make online SSH session work
  #   default = ["0.0.0.0/0"]
  default = ["176.37.52.0/24", "194.183.168.0/24"]
}

variable "region" {
  default = "us-central1"
}

variable "subnet_cidr" {
  default = "192.168.0.0/24"
}

variable "app_name" {
  default = "nginx"
}
