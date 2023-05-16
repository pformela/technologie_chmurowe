#!/bin/bash

cd fastapi-app
docker build -t fastapi_1 .
cd ..
docker build -t nginx_1 .
docker network create my_network

docker run -d --name fastapi --network my_network -p 3000:3000 fastapi_1
docker run -d --name nginx --network my_network -p 80:80 nginx_1