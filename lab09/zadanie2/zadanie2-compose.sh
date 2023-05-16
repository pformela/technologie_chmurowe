#!/bin/bash

docker buildx create --name mybuilder
docker buildx use mybuilder
cd app && docker login && docker buildx build --platform linux/amd64,linux/arm64/v8 -t pformela/lab09zadanie2:latest --file Dockerfile --push .

cd ..

docker compose build --no-cache 
docker compose up -d