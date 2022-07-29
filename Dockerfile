FROM node:16-alpine as build

WORKDIR /app

COPY *.json .
COPY ./src ./src

RUN npm i -g typescript && npm install && tsc --build 

FROM node:16-alpine as prod

WORKDIR /app

COPY package.json .
RUN npm i --only=prod
COPY --from=build /app/dist .

ENTRYPOINT [ "node", "server" ]
