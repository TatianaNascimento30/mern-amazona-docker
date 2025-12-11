MERN Amazona — Arquitetura com Docker
Primeira entrega do Desafio de Novembro

Entrega desta etapa: Backend + Frontend + MongoDB, tudo funcionando via Docker.

O que foi entregue
Backend Node.js funcionando via Docker
Frontend React funcionando via Docker
Banco MongoDB em container
API funcional (/api/products)
Rota de seed funcionando (/api/products/seed)
Nginx servindo o frontend e roteando corretamente
Arquitetura totalmente containerizada
Estrutura do projeto
mern-amazona/
 ├── backend/
 │   ├── models/
 │   ├── routes/
 │   ├── server.js
 │   ├── data.js
 │   └── Dockerfile
 ├── frontend/
 │   ├── public/
 │   ├── src/
 │   ├── nginx.conf
 │   └── Dockerfile
 ├── docker-compose.yml
 └── README.md

Como rodar o projeto (Docker)
1) Subir todos os serviços
docker compose up -d --build

2) Verificar containers
docker ps


Você deve ver:

backend

frontend

mongo

network criada

Como acessar
Frontend

http://localhost:3000

Backend (API)

http://localhost:4000/api/products

Seed (popular o banco)

http://localhost:4000/api/products/seed

Banco de Dados

MongoDB sobe automaticamente no container

Volume persistente criado via Docker

Não precisa instalar nada localmente

Testes básicos antes da equipe continuar

Navegar no frontend
Ver produtos listados
A chamada /api/products retorna os itens
Seed funcionando
Tudo já testado e funcionando

Desenvolvido pelo time para o Desafio de Novembro

## Infraestrutura (EKS + Kubernetes + Terraform)

- Cluster Kubernetes rodando no **AWS EKS** (criado inicialmente via console).
- Aplicação MERN (frontend, backend, MongoDB) empacotada em **Docker**.
- Manifests Kubernetes em `k8s/`:
  - `mongo.yaml`
  - `backend-deployment.yaml` / `backend-service.yaml`
  - `frontend-deployment.yaml` / `frontend-service.yaml`
- Acesso à aplicação via:
  - `kubectl port-forward svc/frontend 3000:3000`
  - Navegador em `http://localhost:3000`

## Infra como Código (Terraform)

- Código Terraform em `terraform/`:
  - `main.tf`: provider AWS + configuração base.
  - `eks.tf`: recursos e/ou leituras relacionadas ao EKS.
  - `variables.tf`: definição de variáveis (região, nome do cluster, tamanhos etc.).
  - `outputs.tf`: informações que o Terraform exporta (por exemplo, nome do cluster, ARN, etc.).
- Comandos locais:
  - `terraform init`
  - `terraform validate`
  - `terraform plan` (será usado depois com credenciais AWS)

## CI/CD no GitHub Actions

- Workflow **CI - Docker build** (`.github/workflows/ci-docker.yml`):
  - Build das imagens Docker de frontend e backend.
- Workflow **Terraform validation workflow** (`.github/workflows/terraform.yml`):
  - `terraform init -backend=false`
  - `terraform fmt -check`
  - `terraform validate`


