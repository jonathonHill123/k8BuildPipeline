variable "env" {}
variable "prefix" {}

resource "google_compute_global_address" "k8buildpipeline-static-ip" {
  name = "k8buildpipeline-${var.env}"
}

resource "google_dns_record_set" "k8buildpipeline-record" {
  name = "${var.prefix}k8buildpipeline.com."
  type = "A"
  ttl  = 300

  managed_zone = "k8buildpipeline"
  rrdatas = ["${google_compute_global_address.k8buildpipeline-static-ip.address}"]
}
