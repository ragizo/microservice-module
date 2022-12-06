variable "project_id"{}

variable "region" {}

variable "gke_cluster_name" {
  default = "gke"
}

variable "application_name" {
  default = "hr"
}

variable "environement" {
  default = "staging"
}

variable "gke_num_nodes" {
  # One node per zones, if we have many zone there will be 1 per zones
  # ie: With 3 zones we will have 3 nodes
  default     = "1"
  description = "Number of nodes"
}

variable "machine_type" {
  default = "n1-standard-1"
}


variable "memory_size_gb" {
  default = 1
}

variable "tier" {
  default = "BASIC"
}

variable "memory_storage_name" {
  default = "memorystorage"
}

variable "cloud_storage_name" {
  default = "cloud-storage"
}

variable "pods_per_node" {
  default = 50
}

variable "vpc" {
  default = "default"
}

variable "subnet" {
  default = "default"
}

variable "google_container_node_pool_name" {
  default = "default"
}


variable "versioning" {
  default = false
}
