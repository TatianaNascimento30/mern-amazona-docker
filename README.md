MERN Amazona — Arquitetura com Docker
Primeira entrega do Desafio de Novembro

Entrega desta etapa: Backend + Frontend + MongoDB, tudo funcionando via Docker.

O que foi entregue
✔ Backend Node.js funcionando via Docker
✔ Frontend React funcionando via Docker
✔ Banco MongoDB em container
✔ API funcional (/api/products)
✔ Rota de seed funcionando (/api/products/seed)
✔ Nginx servindo o frontend e roteando corretamente
✔ Arquitetura totalmente containerizada
📁 Estrutura do projeto
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

✔ Navegar no frontend
✔ Ver produtos listados
✔ A chamada /api/products retorna os itens
✔ Seed funcionando
✔ Tudo já testado e funcionando

Desenvolvido pelo time para o Desafio de Novembro
