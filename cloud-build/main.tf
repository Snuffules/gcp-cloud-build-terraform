data "terraform_remote_state" "db" {
  backend = "gcs"
  config = {
    # Replace this with your bucket name!
    bucket = "snf-gcp-tf-state"
    #key    = "terraform/state/default.tfstate"
    #region = "europe-west-3"
  }
}

resource "google_compute_instance" "vm_instance" {
  name         = "solana-node"
  machine_type = "n2d-highmem-64"

  network_interface {
    network    = "network1"
    subnetwork = google_compute_subnetwork.network1_subnet1.name

    access_config {
      // Ephemeral IP. Leave this block empty if you don't want to assign a public IP.
    }
  }

  tags = ["solana-node"]

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20230417"
      size  = 2000 # Disk size in GB
      type  = "pd-ssd"
    }
  }
}

