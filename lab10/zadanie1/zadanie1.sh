#!/bin/bash

docker build -t pformela/zadanie01-app ./app
docker push pformela/zadanie01-app:latest