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


