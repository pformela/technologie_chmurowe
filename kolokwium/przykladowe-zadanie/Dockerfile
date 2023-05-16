FROM alpine:latest AS build
ENV GIT_REPO=https://github.com/pformela/sample-react-app-for-exercise.git

WORKDIR /app
RUN apk update && apk upgrade
RUN apk --no-cache add curl
RUN apk add git
RUN apk add nodejs
RUN apk add npm
RUN git clone $GIT_REPO
RUN ls -la
RUN cd sample-react-app-for-exercise && npm install
RUN cd sample-react-app-for-exercise && npm run build

FROM nginx:latest
COPY --from=build /app/sample-react-app-for-exercise/build /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]



