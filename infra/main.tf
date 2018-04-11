terraform {
  backend "gcs" {
    bucket = "terraform-k8buildpipeline"
    # path = "provided at runtime"
  }
}

variable "env" {}
variable "dns_prefix" {}
variable "cluster_name" {}

provider "google" {
  version = "~> 1.0"
  project = "k8buildpipeline"
}

module "dns" {
  source = "modules/dns"
  prefix = "${var.dns_prefix}"
  env = "${var.env}"
}

module "cluster" {
  source = "modules/cluster"
  cluster_name = "${var.cluster_name}"
}
