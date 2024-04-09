resource "google_project_service" "compute_service" {
  project = 
  service = "compute.googleapis.com"
}
