resource "google_compute_network" "vpc_network" {
  name                    = "tf-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "tf-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = "asia-south1"
  network       = google_compute_network.vpc_network.id
}

# Create a firewall to allow SSH connection from the specified source range
resource "google_compute_firewall" "firewall_rule" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["34.126.0.0/18"]
}
