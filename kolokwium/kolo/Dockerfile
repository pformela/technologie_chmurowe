# Second stage - running the app
FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf

ENV SERVER_PORT=3000

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

