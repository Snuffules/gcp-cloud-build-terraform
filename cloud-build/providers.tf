resource "google_project_service" "compute_service" {
  project = "vladimir-europe-cloud-tests"
  service = "compute.googleapis.com"
}
