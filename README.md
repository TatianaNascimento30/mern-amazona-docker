# MERN Amazona — Arquitetura Containerizada

Projeto desenvolvido para o **Super Desafio Mensal**, com foco na construção de uma **arquitetura integrada e funcional** utilizando Docker, Kubernetes, CI/CD e Infrastructure as Code.

---

## Objetivo
Projetar e implementar uma arquitetura moderna para uma aplicação MERN, integrando:
- Containers Docker
- Orquestração com Kubernetes (EKS)
- CI/CD com GitHub Actions
- Segurança no pipeline (SAST, SCA, IaC)
- Terraform como base de IaC

---

## Visão Geral da Arquitetura
- **Frontend:** React  
- **Backend:** Node.js / Express  
- **Banco:** MongoDB  
- **Containers:** Docker  
- **Orquestração:** Kubernetes (AWS EKS)  
- **CI/CD:** GitHub Actions  
- **IaC:** Terraform  

Detalhes completos da arquitetura estão em `docs/`.

---

## Executar localmente com Docker
```bash
docker compose up -d --build
Acessos
Frontend: http://localhost:3000

Backend: http://localhost:4000/api/products

Kubernetes (EKS)
A aplicação foi implantada em um cluster Kubernetes no AWS EKS utilizando manifests declarativos.

Detalhes: docs/kubernetes.md

Terraform
O Terraform é utilizado para validação e padronização da infraestrutura, além de servir como base para evolução futura de IaC completo.

Detalhes: docs/terraform.md

Evidências
Prints e validações estão documentados em docs/evidencias.md.

Projeto desenvolvido em equipe para o Super Desafio Mensal.