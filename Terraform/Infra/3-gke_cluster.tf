resource "google_container_cluster" "gke_cluster" {
  name                     = "tf-gke-cluster"
  location                 = "asia-south1-a"
  network                  = google_compute_network.vpc_network.self_link
  subnetwork               = google_compute_subnetwork.subnet.self_link
  deletion_protection      = false
  remove_default_node_pool = true
  networking_mode          = "VPC_NATIVE"
  initial_node_count       = 1

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "10.13.0.0/28"
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.11.0.0/20"
    services_ipv4_cidr_block = "10.12.0.0/20"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "122.171.17.129/32"
      display_name = "shreya"
    }
  }
}

resource "google_container_node_pool" "gke_nodepool" {
  name       = "tf-gke-nodepool"
  location   = "asia-south1-a"
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}
