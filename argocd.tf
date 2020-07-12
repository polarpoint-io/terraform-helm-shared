locals {
  argo = merge(
    local.helm_defaults,
    {
      name          = "argocd"
      namespace     = "argocd"
      chart         = "argocd"
      chart_version = "2.5.3"
      version       = "v1.6.1"
      repository    = local.helm_repo_argo.url
      create_ns     = true
      skip_crds     = false
    },
    var.argo
  )

  values_external_secrets = <<VALUES
image:
  tag: ${local.argocd["version"]}
VALUES

}

resource "kubernetes_namespace" "argocd" {
  count = local.argocd["enabled"] && local.argocd["create_ns"] ? 1 : 0

  metadata {
    labels = {
      name = local.argocd["namespace"]
    }

    name = local.argocd["namespace"]
  }
}

resource "helm_release" "argocd" {
  count                 = local.argocd["enabled"] ? 1 : 0
  repository            = local.argocd["repository"]
  name                  = local.argocd["name"]
  chart                 = local.argocd["chart"]
  version               = local.argocd["chart_version"]
  timeout               = local.argocd["timeout"]
  force_update          = local.argocd["force_update"]
  recreate_pods         = local.argocd["recreate_pods"]
  wait                  = local.argocd["wait"]
  atomic                = local.argocd["atomic"]
  cleanup_on_fail       = local.argocd["cleanup_on_fail"]
  dependency_update     = local.argocd["dependency_update"]
  disable_crd_hooks     = local.argocd["disable_crd_hooks"]
  disable_webhooks      = local.argocd["disable_webhooks"]
  render_subchart_notes = local.argocd["render_subchart_notes"]
  replace               = local.argocd["replace"]
  reset_values          = local.argocd["reset_values"]
  reuse_values          = local.argocd["reuse_values"]
  skip_crds             = local.argocd["skip_crds"]
  verify                = local.argocd["verify"]
  values = [
    local.argocd,
    local.argocd["extra_values"]
  ]
  namespace = local.argocd["namespace"]

  depends_on = [
    helm_release.kiam
  ]
}

resource "kubernetes_network_policy" "argocd_default_deny" {
  count = local.argocd["create_ns"] && local.argocd["enabled"] && local.argocd["default_network_policy"] ? 1 : 0

  metadata {
    name      = "${kubernetes_namespace.argocd.*.metadata.0.name[count.index]}-default-deny"
    namespace = kubernetes_namespace.argocd.*.metadata.0.name[count.index]
  }

  spec {
    pod_selector {
    }
    policy_types = ["Ingress"]
  }
}

resource "kubernetes_network_policy" "argocd_allow_namespace" {
  count = local.argocd["create_ns"] && local.argocd["enabled"] && local.argocd["default_network_policy"] ? 1 : 0

  metadata {
    name      = "${kubernetes_namespace.argocd.*.metadata.0.name[count.index]}-allow-namespace"
    namespace = kubernetes_namespace.argocd.*.metadata.0.name[count.index]
  }

  spec {
    pod_selector {
    }

    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = kubernetes_namespace.argocd.*.metadata.0.name[count.index]
          }
        }
      }
    }

    policy_types = ["Ingress"]
  }
}

