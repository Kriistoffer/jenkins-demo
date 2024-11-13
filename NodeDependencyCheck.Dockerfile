FROM node:16-alpine

WORKDIR /
RUN npm install
RUN npm --version