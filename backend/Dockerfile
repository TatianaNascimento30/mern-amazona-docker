# Etapa 1 - Imagem base leve e verificada
FROM node:20-slim AS build

# Cria diretório de trabalho
WORKDIR /usr/src/app

# Copia apenas o package.json e package-lock.json primeiro (boa prática de cache)
COPY package*.json ./

# Instala dependências com npm ci (mais seguro e reproduzível)
RUN npm ci --only=production

# Copia o restante do código da aplicação
COPY . .

# Cria usuário sem privilégios (evita rodar como root)
RUN useradd --user-group --create-home --shell /bin/false appuser
USER appuser

# Expõe apenas a porta necessária
EXPOSE 4000

# Usa variável de ambiente segura (padrão de boas práticas)
ENV NODE_ENV=production

# Comando de inicialização
CMD ["node", "server.js"]
