output "vpc_name" {
  value       = google_compute_network.vpc.name
  description = "The name of the VPC have bean created"
}

output "vpc_id" {
  value       = google_compute_network.vpc.id
  description = "The id of the VPC have bean created"
}

# output "vpc_self_link" {
#   value       = google_compute_network.gke-lab-vpc.self_link
#   description = "The URI of the VPC being created"
# }

output "subnet_name" {
  value       = google_compute_subnetwork.gke_subnet.name
  description = "The name of the subnet have bean created"
}

output "subnet_id" {
  value       = google_compute_subnetwork.gke_subnet.id
  description = "The id of the subnet have bean created"
}
