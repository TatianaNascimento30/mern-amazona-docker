# ============================
# 1️⃣ Build do React
# ============================
FROM node:20-slim AS build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

# ============================
# 2️⃣ Nginx servindo o build
# ============================
FROM nginx:1.25-alpine

# Copia o build
COPY --from=build /app/build /usr/share/nginx/html

# Copia SOMENTE o default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# NÃO sobrescreve o nginx.conf principal
# NÃO mexe no PID
# NÃO mexe no include
# NÃO cria pastas (nginx já tem)

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
