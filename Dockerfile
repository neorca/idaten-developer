# ステージ1: ビルド環境
FROM node:20.9.0 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install -g npm@latest
COPY . .
RUN npm run build

# ステージ2: 実行環境
FROM node:20.9.0
WORKDIR /app
COPY --from=builder /app/next.config.js ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000
CMD ["npm", "start"]
