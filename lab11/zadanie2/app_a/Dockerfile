FROM node

WORKDIR /app

COPY server.js /app
COPY package.json /app

RUN npm install

CMD node server.js

EXPOSE 3000