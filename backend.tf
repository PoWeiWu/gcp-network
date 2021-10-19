terraform {
  backend "remote" {
    organization = "gcp-lab"

    workspaces {
      name = "gcp-network"
    }
  }
}