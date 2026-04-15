resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = var.cluster_name
  location   = "us-west1-a"
  node_count = 2

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
