# --- Service Account ---
resource "google_service_account" "ccm_csi" {
  project      = local.project
  account_id   = format("%s-ccm-csi", local.vcluster_name)
  display_name = format("CCM/CSI role for %s", local.vcluster_name)
  description  = "Used by Kubernetes nodes (IMDS tokens) for CCM/CSI"
}

# --- IAM Roles for that Service Account ---
# Adjust the roles to match what CCM + CSI need
resource "google_project_iam_member" "ccm_csi" {
  for_each = toset([
    "roles/compute.viewer",
    "roles/compute.loadBalancerAdmin",
    "roles/compute.networkAdmin",
    "roles/compute.instanceAdmin.v1",
    "roles/compute.storageAdmin",
    "roles/compute.securityAdmin"
  ])

  project = local.project
  role    = each.value
  member  = "serviceAccount:${google_service_account.ccm_csi.email}"
}
