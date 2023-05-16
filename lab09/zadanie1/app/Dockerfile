FROM node
ARG REDIS_HOST=

ENV REDIS_HOST=$REDIS_HOST

WORKDIR /app

COPY package.json .
RUN npm install

COPY server.js .

EXPOSE 3000

HEALTHCHECK --interval=30s \
            --timeout=30s \
            --start-period=5s \
            --retries=3 \
            CMD curl -f http://localhost:3000/messages || exit 1

CMD ["npm", "start"]