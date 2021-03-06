FROM node:lts-alpine

ARG CONTAINER_PORT
ARG API_URL

ENV ROOT="/app"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo
ENV HOST=0.0.0.0
ENV API_URL=${API_URL}

WORKDIR ${ROOT}

COPY package*.json ./
RUN yarn install

COPY . ./

RUN yarn run build

EXPOSE ${CONTAINER_PORT}
