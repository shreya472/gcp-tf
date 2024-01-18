resource "google_compute_router" "cloud_router" {
  name    = "tf-nat-router"
  region  = "asia-south1"
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "cloud_nat" {
  name   = "nat-gateway"
  router = google_compute_router.cloud_router.name
  region = "asia-south1"

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_ip_allocate_option             = "AUTO_ONLY"

}

resource "google_compute_address" "nat" {
  name         = "nat-ip"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"

}
