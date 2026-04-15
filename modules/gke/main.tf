resource "google_container_cluster" "primary" {
  name     = "simple-api-cluster"
  location = "us-west1-a"

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.network
  subnetwork = var.subnet
}
