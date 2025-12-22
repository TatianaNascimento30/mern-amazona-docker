# MERN Amazona — Arquitetura Containerizada

Projeto desenvolvido para o **Super Desafio Mensal**, com foco na construção de uma **arquitetura moderna, integrada e reproduzível**, utilizando Docker, Kubernetes, CI/CD e Infrastructure as Code (IaC).

---

## 🎯 Objetivo

Projetar e implementar uma arquitetura para uma aplicação **MERN**, integrando:

- Containers Docker  
- Orquestração com Kubernetes  
- CI/CD com GitHub Actions  
- Segurança no pipeline (SAST, SCA, IaC)  
- Infrastructure as Code com Terraform  

O projeto foi entregue com **execução local via Minikube**, mantendo **AWS EKS como arquitetura-alvo para produção**.

---

## Visão Geral da Arquitetura

### Componentes
- **Frontend:** React  
- **Backend:** Node.js / Express  
- **Banco de Dados:** MongoDB  
- **Containers:** Docker  
- **Orquestração:** Kubernetes  
- **IaC:** Terraform  
- **CI/CD:** GitHub Actions  

### Ambientes
- **Local / Demo:** Docker Compose e Kubernetes (Minikube)
- **Produção (arquitetura alvo):** AWS EKS

---

## Execução local com Docker (opcional)

Utilizado para desenvolvimento e validação local, sem dependência de Kubernetes.

docker compose up -d --build

## Acessos
Frontend: http://localhost:3000

Backend: http://localhost:4000/api/products

### Execução no Kubernetes (Minikube)
A aplicação é implantada em um cluster Kubernetes local utilizando Minikube, com manifests declarativos localizados na pasta k8s/.

## Aplicação dos manifests (manual)
bash
Copiar código
kubectl apply -f k8s/

## Validação
bash
Copiar código
kubectl get pods
kubectl get svc

## Acesso à aplicação
Para evitar exposição externa:

kubectl port-forward -n desafio-time-b svc/frontend 3000:3000

## Aplicação disponível em:

http://localhost:3000

### Terraform (Infrastructure as Code)

O Terraform é utilizado neste projeto como orquestrador de infraestrutura Kubernetes local, com os seguintes objetivos:

Padronizar a aplicação dos manifests Kubernetes

Garantir reprodutibilidade do ambiente

Demonstrar abordagem IaC mesmo em ambiente local

Preparar o projeto para evolução futura em cloud (AWS EKS)

## Fluxo Terraform (Minikube)

terraform init
terraform plan
terraform apply
terraform destroy

Internamente, o Terraform executa comandos kubectl via null_resource, garantindo:

Criação do namespace

Deploy completo da aplicação

Destroy controlado do ambiente

### CI/CD (GitHub Actions)

O projeto possui pipelines automatizadas:

## CI

Build das imagens Docker (frontend e backend)

## Terraform CI
terraform init

terraform fmt

terraform validate

## Kubernetes

Validação de manifests YAML

Validação de schema Kubernetes

### Segurança
A segurança está integrada ao pipeline CI/CD, incluindo:

SAST

SCA

IaC Security

## Ferramentas utilizadas:

Checkmarx One

### Documentação complementar

Arquitetura: docs/arquitetura.md

Kubernetes: docs/kubernetes.md

Terraform: docs/terraform.md

Evidências: docs/evidencias.md

### Evidências
Prints e validações da aplicação em execução estão disponíveis em:

docs/evidencias/