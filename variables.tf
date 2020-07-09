variable "cluster-name" {
  description = "Name of the Kubernetes cluster"
  default     = "sample-cluster"
  type        = string
}
variable "aws" {
  description = "AWS provider customization"
  type        = any
  default     = {}
}

variable "eks" {
  description = "EKS cluster inputs"
  type        = any
  default     = {}
}

variable "cluster_autoscaler" {
  description = "Customize cluster-autoscaler chart, see `cluster_autoscaler.tf` for supported values"
  type        = any
  default     = {}
}

variable "kiam" {
  description = "Customize kiam chart, see `kiam.tf` for supported values"
  type        = any
  default     = {}
}

variable "metrics_server" {
  description = "Customize metrics-server chart, see `metrics_server.tf` for supported values"
  type        = any
  default     = {}
}

variable "fluentd_cloudwatch" {
  description = "Customize fluentd-cloudwatch chart, see `fluentd-cloudwatch.tf` for supported values"
  type        = any
  default     = {}
}

variable "npd" {
  description = "Customize node-problem-detector chart, see `npd.tf` for supported values"
  type        = any
  default     = {}
}


variable "cni_metrics_helper" {
  description = "Customize cni-metrics-helper deployment, see `cni_metrics_helper.tf` for supported values"
  type        = any
  default     = {}
}


variable "helm_defaults" {
  description = "Customize default Helm behaviour"
  type        = any
  default     = {}
}

variable "priority_class" {
  description = "Customize a priority class for addons"
  type        = any
  default     = {}
}

variable "priority_class_ds" {
  description = "Customize a priority class for addons daemonsets"
  type        = any
  default     = {}
}

variable "external_secrets" {
  description = "Customise external-secrets chart, see `external-secrets.tf` for supported values"
  type        = any
  default     = {}
}

