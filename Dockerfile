FROM node:20-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends python3 make g++ git ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json ./
RUN npm install --legacy-peer-deps --omit=dev --no-audit --no-fund

COPY index.js ./

ENV NODE_ENV=production

CMD ["node", "index.js"]
