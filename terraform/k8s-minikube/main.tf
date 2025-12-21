terraform {
  required_version = ">= 1.5.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.26.0"
    }
  }
}

provider "kubernetes" {
  config_path    = pathexpand("~/.kube/config")
  config_context = "minikube"
}

locals {
  # pega todos os YAMLs dentro da pasta /k8s
  manifest_files = fileset("${path.module}/../../k8s", "*.yaml")
}

resource "kubernetes_manifest" "all" {
  for_each = local.manifest_files

  manifest = yamldecode(file("${path.module}/../../k8s/${each.value}"))
}
