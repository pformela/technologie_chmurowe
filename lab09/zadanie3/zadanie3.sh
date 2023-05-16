#!/bin/bash

docker buildx create --name mybuilder --use --platform linux/amd64,linux/arm64,linux/arm/v7,windows/amd64
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,windows/amd64 --push -t pformela/lab09zadanie3:linux .
docker buildx build --platform windows/amd64 -t pformela/lab09zadanie3:windows .

docker manifest create pformela/lab09zadanie3:latest --amend pformela/lab09zadanie3:linux --amend pformela/lab09zadanie3:windows
docker manifest push pformela/lab09zadanie3