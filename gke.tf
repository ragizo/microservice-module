
resource "google_container_cluster" "primary" {
  # "${var.gke_cluser_name}-${var.application_name}-${var.environement}"
  name     = var.gke_cluster_name
  location = var.region

  # We can't create a cluster with no node pool defined
  # but we want to only use separetly managed node pools
  # So we create the smallest possible default
  # node pool and immediatly delete it
  remove_default_node_pool = true
  initial_node_count       = 2

  default_max_pods_per_node = var.pods_per_node
  enable_shielded_nodes = true

  network    = var.vpc
  subnetwork = var.subnet
}

resource "google_container_node_pool" "primary_node" {
  #${google_container_cluster.primary.name}-node-pool"
  name       = var.google_container_node_pool_name
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    machine_type = var.machine_type
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
