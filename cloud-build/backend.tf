terraform {
  backend "gcs" {
    bucket  = "snf-gcp-tf-state"
    prefix  = "terraform/state"
  }
}
