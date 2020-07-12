# terraform-helm-shared


## About

Provides various helm charts for shared services running on EKS 

## Main features

* Common addons with associated IAM permissions if needed:
  * [cluster-autoscaler](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler): scale worker nodes based on workload.
  * [kiam](https://github.com/uswitch/kiam): prevents pods to access EC2 metadata and enables pods to assume specific AWS IAM roles.
  * [metrics-server](https://github.com/kubernetes-incubator/metrics-server): enable metrics API and horizontal pod scaling (HPA).
  * [fluentd-cloudwatch](https://github.com/helm/charts/tree/master/incubator/fluentd-cloudwatch): forwards logs to AWS Cloudwatch.
  * [node-problem-detector](https://github.com/kubernetes/node-problem-detector): Forwards node problems to Kubernetes events
  * [external-secrets](https://github.com/godaddy/kubernetes-external-secrets/) : Kubernetes External Secrets allows you to use external secret management systems

## Requirements

* [Terraform](https://www.terraform.io/intro/getting-started/install.html)
* [Terragrunt](https://github.com/gruntwork-io/terragrunt#install-terragrunt)
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [helm](https://helm.sh/)
* [aws-iam-authenticator](https://github.com/kubernetes-sigs/aws-iam-authenticator)

## Documentation

User guides, feature documentation and examples are available [here](https://clusterfrak-dynamics.github.io/teks/)

## IAM permissions

This module can use either [IRSA](https://aws.amazon.com/blogs/opensource/introducing-fine-grained-iam-roles-service-accounts/) which is the recommanded method or [Kiam](https://github.com/uswitch/kiam).

## About Kiam

Kiam prevents pods from accessing EC2 instances IAM role and therefore using the instances role to perform actions on AWS. It also allows pods to assume specific IAM roles if needed. To do so `kiam-agent` acts as an iptables proxy on nodes. It intercepts requests made to EC2 metadata and redirect them to a `kiam-server` that fetches IAM credentials and pass them to pods.

Kiam is running with an IAM user and use a secret key and a access key (AK/SK).

### Addons that require specific IAM permissions

Some addons interface with AWS API, for example:

* `cluster-autoscaler`
* `cni-metric-helper`
* `kubernetes-external-secrets`

## Terraform docs
<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| helm | n/a |
| kubectl | n/a |
| kubernetes | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws | AWS provider customization | `any` | `{}` | no |
| cluster-name | Name of the Kubernetes cluster | `string` | `"sample-cluster"` | no |
| cluster\_autoscaler | Customise cluster-autoscaler chart, see `cluster_autoscaler.tf` for supported values | `any` | `{}` | no |
| cni\_metrics\_helper | Customise cni-metrics-helper deployment, see `cni_metrics_helper.tf` for supported values | `any` | `{}` | no |
| eks | EKS cluster inputs | `any` | `{}` | no |
| external\_secrets | Customise external-secrets chart, see `external-secrets.tf` for supported values | `any` | `{}` | no |
| fluentd\_cloudwatch | Customise fluentd-cloudwatch chart, see `fluentd-cloudwatch.tf` for supported values | `any` | `{}` | no |
| helm\_defaults | Customise default Helm behaviour | `any` | `{}` | no |
| kiam | Customise kiam chart, see `kiam.tf` for supported values | `any` | `{}` | no |
| metrics\_server | Customise metrics-server chart, see `metrics_server.tf` for supported values | `any` | `{}` | no |
| nginx\_ingress | Customise nginx-ingress chart, see `nginx-ingress.tf` for supported values | `any` | `{}` | no |
| npd | Customise node-problem-detector chart, see `npd.tf` for supported values | `any` | `{}` | no |
| priority\_class | Customise a priority class for addons | `any` | `{}` | no |
| priority\_class\_ds | Customise a priority class for addons daemonsets | `any` | `{}` | no |
| prometheus\_operator | Customise prometheus-operator chart, see `kube_prometheus.tf` for supported values | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| grafana\_password | n/a |
| kiam-server-role-arn | n/a |
| kiam-server-role-name | n/a |

<!--- END_TF_DOCS --->
