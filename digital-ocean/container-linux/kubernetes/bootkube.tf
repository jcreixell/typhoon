# Self-hosted Kubernetes assets (kubeconfig, manifests)
module "bootkube" {
  source = "git::https://github.com/poseidon/terraform-render-bootkube.git?ref=v0.8.1"

  cluster_name = "${var.cluster_name}"
  api_servers  = ["${format("%s.%s", var.cluster_name, var.dns_zone)}"]
  etcd_servers = "${digitalocean_record.etcds.*.fqdn}"
  asset_dir    = "${var.asset_dir}"
  networking   = "${var.networking}"
  network_mtu  = 1440
  pod_cidr     = "${var.pod_cidr}"
  service_cidr = "${var.service_cidr}"
}
