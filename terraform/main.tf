########################################
# BLOCO PRINCIPAL DO TERRAFORM
########################################

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Por enquanto usaremos state local (em arquivo).
  # Depois, se quiser deixar nível “cliente enterprise”,
  # podemos mover para um backend remoto (S3 + DynamoDB).
}

########################################
# PROVIDER AWS
########################################

provider "aws" {
  region = var.aws_region
}
