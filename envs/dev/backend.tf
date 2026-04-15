terraform {
  backend "gcs" {
    bucket  = "project-21909151-ff87-467b-bd6-tf-state"
    prefix  = "gke-dev"
  }
}
