# Obraz ubuntu z zainstalowanym nodejs
FROM ubuntu
ENV NODE_ENV=development

WORKDIR /myapp/src
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && apt-get install -y nodejs npm
RUN apt-get update && apt-get install -y curl
COPY /myapp /myapp/src/
RUN npm install -g n
RUN n 16.13.0
RUN npm install
RUN npm run build

# Obraz nginx
FROM nginx

COPY --from=0 /myapp/src /usr/share/nginx/html
RUN cd /usr/share/nginx/html

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]