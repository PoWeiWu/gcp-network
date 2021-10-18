variable "region" {
  description = "gcp resource work region"
  default     = "asia-east1"
}

variable "project_id" {
  default = "gcp work project"
}

variable "vpc_name" {
  description = "vpc name"
}

variable "subnet_name" {
  description = "subnet name"
}

variable "subnet_region" {
  description = "which region is subnet created"
}

variable "subnet_cidr" {
  description = "What size is subnet created"
}

variable "credentials" {
  description = "Google Cloud Platform credentials"
  default     = ""
}

variable "credentials_file" {
  description = "Location of Google Cloud Platform credentials file"
  default     = ""
}

