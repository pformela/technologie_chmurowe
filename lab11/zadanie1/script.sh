#!/bin/bash

cd app_a && docker build --push --no-cache -t pformela/microservice_a:latest .
cd ..

cd app_b && docker build --push --no-cache -t pformela/microservice_b:latest .
cd ..

kubectl apply -f deployment_b.yaml
kubectl apply -f deployment_a.yaml
