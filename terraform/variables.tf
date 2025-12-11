########################################
# VARIABLES
########################################

# Região onde o EKS foi criado
variable "aws_region" {
  description = "AWS region where the resources will be created"
  type        = string
  default     = "us-east-2"
}

# Nome lógico do projeto (prefixo para recursos)
variable "project_name" {
  description = "Project name used as prefix in resource naming"
  type        = string
  default     = "mern-amazona"
}

# Nome do cluster EKS já existente
variable "eks_cluster_name" {
  description = "Existing EKS cluster name where the app will be deployed"
  type        = string
  default     = "time-B" # depois vamos ajustar para o nome exato do cluster
}
