terraform {
  required_version = ">= 1.5.0"

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = ">= 3.2.0"
    }
  }
}

locals {
  namespace = "desafio-time-b"
  k8s_dir   = "${path.module}/../../k8s"

  # Hash dos manifests: muda quando qualquer YAML muda (assim o apply re-executa)
  manifests_hash = sha1(join("", [
    for f in sort(fileset(local.k8s_dir, "*.yaml")) : filesha256("${local.k8s_dir}/${f}")
  ]))
}

resource "null_resource" "k8s" {
  triggers = {
    namespace      = local.namespace
    manifests_hash = local.manifests_hash
  }

  # APPLY (create)
  provisioner "local-exec" {
    interpreter = ["PowerShell", "-NoProfile", "-Command"]
    command     = <<-EOT
      kubectl create namespace ${local.namespace} --dry-run=client -o yaml | kubectl apply -f -
      kubectl apply -n ${local.namespace} -f ../../k8s
    EOT
  }

  # DESTROY
  # IMPORTANTE: no destroy só pode usar self.triggers.*
  provisioner "local-exec" {
    when        = destroy
    interpreter = ["PowerShell", "-NoProfile", "-Command"]
    command     = <<-EOT
      kubectl delete -n ${self.triggers.namespace} -f ../../k8s --ignore-not-found
      kubectl delete namespace ${self.triggers.namespace} --ignore-not-found
    EOT
  }
}
