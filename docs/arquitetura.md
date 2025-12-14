# Arquitetura da Solução

## Contexto
Este projeto foi desenvolvido como parte do **Super Desafio Mensal**, com o objetivo de construir uma arquitetura moderna, integrada e funcional, utilizando práticas de DevOps, containers, orquestração e automação.

O foco do desafio é a **complexidade arquitetural**, a integração entre os componentes e a clareza na apresentação da solução.

---

## Visão Geral
A solução é baseada em uma aplicação **MERN**, composta por frontend, backend e banco de dados, totalmente containerizada e implantada em um ambiente Kubernetes na nuvem.

A arquitetura foi pensada para cobrir todo o ciclo de vida da aplicação:
- desenvolvimento local
- empacotamento em containers
- publicação de imagens
- orquestração em cluster Kubernetes
- validações automatizadas via CI/CD

---

## Componentes da Arquitetura
- **Frontend (React):** interface web da aplicação.
- **Backend (Node.js / Express):** APIs REST responsáveis pela lógica de negócio.
- **MongoDB:** banco de dados NoSQL.
- **Docker:** empacotamento da aplicação em containers.
- **Docker Hub:** repositório das imagens Docker.
- **Kubernetes (AWS EKS):** orquestração dos containers.
- **GitHub Actions:** automação de CI/CD.
- **Terraform:** validação e base para Infrastructure as Code.

---

## Fluxo de Funcionamento (Alto Nível)
1. O código é versionado no GitHub.
2. Pipelines de CI executam:
   - build das imagens Docker
   - validações de infraestrutura (Terraform)
   - validações de segurança (realizadas pelo time responsável).
3. As imagens são utilizadas nos manifests Kubernetes.
4. A aplicação é implantada no cluster EKS.
5. O acesso é validado via Kubernetes (`kubectl`, `port-forward`).

---

## Decisões Arquiteturais
- **Docker Compose** é utilizado para desenvolvimento e testes locais.
- **Kubernetes (EKS)** é utilizado para orquestração em ambiente cloud.
- O cluster EKS foi provisionado manualmente para agilizar os testes e reduzir riscos de custo.
- **Terraform** é utilizado para padronização, validação e como base para evolução futura de IaC completo.

---

## Considerações Finais
A arquitetura atende aos critérios do desafio ao integrar containers, Kubernetes, CI/CD e Infrastructure as Code, priorizando organização, boas práticas e clareza na apresentação da solução.
