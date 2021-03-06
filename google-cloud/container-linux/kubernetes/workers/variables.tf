variable "cluster_name" {
  type        = "string"
  description = "Unique cluster name"
}

variable "ssh_authorized_key" {
  type        = "string"
  description = "SSH public key for logging in as user 'core'"
}

variable "network" {
  type        = "string"
  description = "Name of the network to attach to the compute instance interfaces"
}

# instances

variable "count" {
  type        = "string"
  description = "Number of worker compute instances the instance group should manage"
}

variable "region" {
  type        = "string"
  description = "Google Cloud region to create a regional managed group of workers (e.g. us-central1, see `gcloud compute regions list`)."
}

variable "machine_type" {
  type        = "string"
  description = "Machine type for compute instances (e.g. gcloud compute machine-types list)"
}

variable "os_image" {
  type        = "string"
  description = "OS image from which to initialize the disk (e.g. gcloud compute images list)"
}

variable "disk_size" {
  type        = "string"
  default     = "40"
  description = "The size of the disk in gigabytes."
}

variable "preemptible" {
  type        = "string"
  default     = "false"
  description = "If enabled, Compute Engine will terminate instances randomly within 24 hours"
}

# configuration

variable "service_cidr" {
  description = <<EOD
CIDR IP range to assign Kubernetes services.
The 1st IP will be reserved for kube_apiserver, the 10th IP will be reserved for kube-dns, the 15th IP will be reserved for self-hosted etcd, and the 200th IP will be reserved for bootstrap self-hosted etcd.
EOD

  type    = "string"
  default = "10.3.0.0/16"
}

# kubeconfig

variable "kubeconfig_ca_cert" {
  type        = "string"
  description = "Generated kubeconfig CA certificate"
}

variable "kubeconfig_kubelet_cert" {
  type        = "string"
  description = "Generated kubeconfig kubelet certificate"
}

variable "kubeconfig_kubelet_key" {
  type        = "string"
  description = "Generated kubeconfig kubelet private key"
}

variable "kubeconfig_server" {
  type        = "string"
  description = "Generated kubeconfig server"
}
