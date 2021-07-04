#phase 1: build
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#phase 2: run
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html