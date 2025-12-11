########################################
# OUTPUTS
########################################

# Região em que estamos trabalhando
output "aws_region" {
  description = "AWS region used by this Terraform module"
  value       = var.aws_region
}

# Nome lógico do projeto
output "project_name" {
  description = "Project name used as prefix in resource naming"
  value       = var.project_name
}

# Nome do cluster EKS existente
output "eks_cluster_name" {
  description = "Existing EKS cluster name where the app is deployed"
  value       = var.eks_cluster_name
}

########################################
# EKS CLUSTER DETAILS
########################################

output "eks_cluster_endpoint" {
  description = "EKS control plane endpoint URL"
  value       = data.aws_eks_cluster.this.endpoint
}

output "eks_cluster_certificate_authority" {
  description = "Base64-encoded certificate authority data for the EKS cluster"
  value       = data.aws_eks_cluster.this.certificate_authority[0].data
}
