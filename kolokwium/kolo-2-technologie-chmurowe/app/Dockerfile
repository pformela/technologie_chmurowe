FROM node

WORKDIR /app

COPY package.json /app
COPY server.js /app
COPY userModel.js /app

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]