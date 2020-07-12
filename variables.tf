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
  description = "Customise cluster-autoscaler chart, see `cluster_autoscaler.tf` for supported values"
  type        = any
  default     = {}
}

variable "kiam" {
  description = "Customise kiam chart, see `kiam.tf` for supported values"
  type        = any
  default     = {}
}

variable "metrics_server" {
  description = "Customise metrics-server chart, see `metrics_server.tf` for supported values"
  type        = any
  default     = {}
}

variable "fluentd_cloudwatch" {
  description = "Customise fluentd-cloudwatch chart, see `fluentd-cloudwatch.tf` for supported values"
  type        = any
  default     = {}
}

variable "npd" {
  description = "Customise node-problem-detector chart, see `npd.tf` for supported values"
  type        = any
  default     = {}
}


variable "cni_metrics_helper" {
  description = "Customise cni-metrics-helper deployment, see `cni_metrics_helper.tf` for supported values"
  type        = any
  default     = {}
}


variable "helm_defaults" {
  description = "Customise default Helm behaviour"
  type        = any
  default     = {}
}

variable "priority_class" {
  description = "Customise a priority class for addons"
  type        = any
  default     = {}
}

variable "priority_class_ds" {
  description = "Customise a priority class for addons daemonsets"
  type        = any
  default     = {}
}

variable "external_secrets" {
  description = "Customise external-secrets chart, see `external-secrets.tf` for supported values"
  type        = any
  default     = {}
}

variable "nginx_ingress" {
  description = "Customise nginx-ingress chart, see `nginx-ingress.tf` for supported values"
  type        = any
  default     = {}
}

variable "prometheus_operator" {
  description = "Customise prometheus-operator chart, see `kube_prometheus.tf` for supported values"
  type        = any
  default     = {}
}

variable "argocd" {
  description = "Customise argocd chart, see `external-secrets.tf` for supported values"
  type        = any
  default     = {}
}