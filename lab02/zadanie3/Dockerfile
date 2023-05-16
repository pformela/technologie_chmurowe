FROM node:16
ENV NODE_ENV=development

WORKDIR /app
COPY ["server.js", "/app/"]
COPY ["restaurantModel.js", "/app/"]
COPY ["config.env", "/app/"]
COPY ["package.json", "/app/"]
RUN npm install

EXPOSE 8080
CMD ["npm", "start"]
