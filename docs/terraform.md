# Terraform (Infrastructure as Code)

## Objetivo
O Terraform foi utilizado neste projeto como base de **Infrastructure as Code (IaC)**, com foco em padronização, validação da infraestrutura e preparação para evolução futura.

---

## Situação Atual
Para acelerar os testes e reduzir riscos de custo durante o desafio, o **cluster Kubernetes (EKS)** foi provisionado manualmente na AWS.

O Terraform foi utilizado para:
- validação da infraestrutura
- padronização do código de IaC
- garantir consistência e qualidade através de pipeline CI

---

## Estrutura do Código Terraform
Os arquivos Terraform estão organizados na pasta `terraform/` e incluem:
- definição do provider AWS
- variáveis de configuração
- outputs
- referências ao cluster EKS existente

---

## Validação com Terraform
A validação do código Terraform é realizada automaticamente via **GitHub Actions**, utilizando os seguintes comandos:

```bash
terraform init -backend=false
terraform fmt -check
terraform validate
Essas validações garantem que o código esteja bem formatado e semanticamente correto.

## Decisão Arquitetural

Optou-se por não realizar o provisionamento completo do EKS via Terraform neste momento, priorizando:

estabilidade do ambiente

controle de custos

foco na integração entre os componentes da arquitetura

## Próximos Passos (Evolução)

Como evolução natural da arquitetura, o Terraform poderá ser utilizado para:

provisionar VPC e EKS via módulos oficiais

configurar backend remoto de state (S3 + DynamoDB)

automatizar o deploy no cluster via pipeline (CD)

## Considerações Finais

O uso do Terraform neste projeto atende aos critérios do desafio ao demonstrar práticas de IaC, mesmo com parte do provisionamento realizado manualmente.