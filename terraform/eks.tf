########################################
# EXISTING EKS CLUSTER (DATA SOURCES)
########################################

# Lê as informações do cluster EKS que já existe
data "aws_eks_cluster" "this" {
  name = var.eks_cluster_name
}

# Lê os dados de autenticação (usados em kubeconfig)
data "aws_eks_cluster_auth" "this" {
  name = var.eks_cluster_name
}
