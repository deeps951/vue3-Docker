# docker/frontend/Dockerfile
FROM node:20-alpine

RUN apk add --no-cache bash git

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /app
