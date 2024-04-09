provider "google" {
  project     = "vladimir-europe-cloud-tests"
  region  = "europe-west-3"
  zone    = "europe-west-3-b"
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

resource "google_project_service" "compute_service" {
  project = local.project_id
  service = "compute.googleapis.com"
}
resource "google_compute_instance" "vm_instance" {
  name         = "solana-node"
  machine_type = "solana-node"

  tags = ["solana-node"]

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20230417"
      size  = 2000  # Disk size in GB
      type  = "pd-ssd"
    }
  }


