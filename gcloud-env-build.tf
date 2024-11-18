provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "discourse-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "discourse-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc_network.self_link
  region        = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "discourse-vm"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

resource "google_compute_firewall" "discourse" {
  name    = "discourse-firewall"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22", "4200", "3000"]
  }

  source_ranges = ["0.0.0.0/0"]
}  

  network_interface {
    network = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link
    access_config {}
  }
}