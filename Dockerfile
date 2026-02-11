FROM node:20-alpine

WORKDIR /usr/src/app

# Copy package files first (better layer caching)
COPY package.json package-lock.json* ./

RUN npm install --no-audit --no-fund

# Copy remaining project files
COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]
