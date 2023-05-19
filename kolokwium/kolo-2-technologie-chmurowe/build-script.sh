#!/bin/bash

docker buildx create --use --name mybuilder

cd app && docker buildx build --push --platform linux/amd64,linux/arm64 -t pformela/express-app:latest -f Dockerfile .

