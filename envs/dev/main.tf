provider "google" {
  project = "project-21909151-ff87-467b-bd6"
  region  = "us-west1"
  zone    = "us-west1-a"
}

module "vpc" {
  source = "../../modules/vpc"
}

module "gke" {
  source     = "../../modules/gke"
  network    = module.vpc.vpc_id
  subnet     = module.vpc.subnet_id
}

module "nodepool" {
  source       = "../../modules/nodepool"
  cluster_name = module.gke.cluster_name
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.cluster_endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = "https://${module.gke.cluster_endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(module.gke.cluster_ca_certificate)
  }
}
