# MERN Amazona — Arquitetura Containerizada

Projeto desenvolvido para o **Super Desafio Mensal**, com foco na construção de uma **arquitetura integrada, funcional e escalável**, utilizando Docker, Kubernetes, CI/CD e Infrastructure as Code (IaC).

---

## Objetivo
Projetar e implementar uma arquitetura moderna para uma aplicação **MERN**, integrando:

- Containers Docker  
- Orquestração com Kubernetes (AWS EKS)  
- CI/CD com GitHub Actions  
- Segurança no pipeline (SAST, SCA, IaC)  
- Terraform como base de Infrastructure as Code  

---

## Visão Geral da Arquitetura
- **Frontend:** React  
- **Backend:** Node.js / Express  
- **Banco de Dados:** MongoDB  
- **Containers:** Docker  
- **Orquestração:** Kubernetes (AWS EKS)  
- **CI/CD:** GitHub Actions  
- **IaC:** Terraform  

A arquitetura foi projetada para permitir execução local via Docker e execução em ambiente Kubernetes no AWS EKS.

# Documentação detalhada:
- Arquitetura: `docs/arquitetura.md`
- Kubernetes: `docs/kubernetes.md`
- Terraform: `docs/terraform.md`
- Evidências: `docs/evidencias.md`

---

## Execução local com Docker (opcional)

Utilizado para desenvolvimento e validação local, sem dependência da AWS.

docker compose up -d --build

# Acessos
Frontend: http://localhost:3000

Backend: http://localhost:4000/api/products

# Execução no Kubernetes (AWS EKS)
A aplicação foi implantada em um cluster Kubernetes no AWS EKS, utilizando manifests declarativos localizados na pasta k8s/.

# Aplicação dos manifests

kubectl apply -f k8s/mongo.yaml
kubectl apply -f k8s/backend-configmap.yaml
kubectl apply -f k8s/backend-secret.yaml
kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/backend-service.yaml
kubectl apply -f k8s/frontend-deployment.yaml
kubectl apply -f k8s/frontend-service.yaml

# Validação

Copiar código
kubectl get pods
kubectl get svc

# Acesso à aplicação

Para evitar custos adicionais com serviços do tipo LoadBalancer, o acesso foi realizado via port-forward:
kubectl port-forward svc/frontend 3000:3000


# A aplicação pode ser acessada em:

http://localhost:3000

# Detalhes técnicos: docs/kubernetes.md

# Terraform (Infrastructure as Code)

O Terraform foi utilizado neste projeto como base de Infrastructure as Code, com foco em:

Padronização do código de infraestrutura

Validação automática via pipeline CI

Preparação para evolução futura do provisionamento completo

# A validação é executada via GitHub Actions utilizando:

terraform init

terraform fmt

terraform validate

# Detalhes: docs/terraform.md

# CI/CD (GitHub Actions)
O projeto possui pipelines automatizadas utilizando GitHub Actions:

CI - Docker build
Build das imagens Docker de frontend e backend.

Terraform CI
Validação do código Terraform.

K8s - Validate Manifests
Validação de sintaxe YAML e schema dos manifests Kubernetes.

# Segurança 
A segurança está integrada à pipeline CI/CD com foco em:

SAST

SCA

IaC Security

Ferramentas:

Checkmarx

# Evidências
As evidências de funcionamento da aplicação (prints e validações) estão documentadas em:

docs/evidencias.md

docs/evidencias/

