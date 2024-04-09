provider "google" {
  project     = "vladimir-europe-cloud-tests"
}

data "terraform_remote_state" "db" {
  backend = "gcs"
  config = {
    # Replace this with your bucket name!
    bucket  = "snf-gcp-tf-state"
    #key    = "terraform/state/default.tfstate"
    #region = "europe-west-3"
  }
}

resource "google_compute_network" "network1" {
  project  = "vladimir-europe-cloud-tests" 
  name                    = "network1"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network1_subnet1" {
  project  = "vladimir-europe-cloud-tests" 

  name          = "solana-node-subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = "europe-west-3"
  network       = google_compute_network.network1.id
}
