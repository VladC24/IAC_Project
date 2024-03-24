FROM node:18-alpine
WORKDIR /application-server
COPY package.json package-lock.json* ./
RUN npm install
COPY . .
EXPOSE 9000
CMD ["node", "app-server.js"]
