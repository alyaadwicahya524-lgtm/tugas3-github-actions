# Pakai versi spesifik (bukan :latest) dan image kecil
FROM node:20-alpine3.20

WORKDIR /app

# Salin file dependency dulu supaya layer cache efisien
COPY package*.json ./
RUN npm install --omit=dev && npm cache clean --force

COPY app.js ./

# Jangan jalankan sebagai root
USER node

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -qO- http://localhost:3000 || exit 1

CMD ["node", "app.js"]
