FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --quiet
COPY . .

FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/package*.json ./
RUN npm ci --production --quiet && npm prune --production
COPY --from=builder /app ./
EXPOSE 5000
CMD ["node", "server.js"]