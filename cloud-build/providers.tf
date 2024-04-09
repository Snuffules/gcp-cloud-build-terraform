resource "google_project_service" "compute_service" {
  project = "vladimir-europe-cloud-tests"
  service = "compute.googleapis.com"
}

provider "google" {
  project     = "vladimir-europe-cloud-tests"
  region  = "europe-west-3"
  zone    = "europe-west-3-b"
}
