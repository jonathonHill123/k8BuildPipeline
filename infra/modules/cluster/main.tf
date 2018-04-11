variable "cluster_name" {}

resource "google_container_cluster" "primary" {
  name               = "${var.cluster_name}"
  zone               = "australia-southeast1-a"
  initial_node_count = 1

  additional_zones = [
    "australia-southeast1-b",
    "australia-southeast1-c",
  ]
}
