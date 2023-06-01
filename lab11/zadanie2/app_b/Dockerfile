FROM node

WORKDIR /app

COPY server.js .
COPY restaurantModel.js .
COPY package.json .

RUN npm install

CMD node server.js

EXPOSE 3000