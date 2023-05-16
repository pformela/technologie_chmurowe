FROM node:14
ENV NODE_ENV=development

WORKDIR /app
COPY ["server.js", "/app/"]
COPY ["package.json", "/app/"]
COPY ["package-lock.json", "/app/"]
RUN npm install

EXPOSE 8080
CMD ["npm", "start"]
