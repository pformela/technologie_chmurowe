#!/bin/bash

# cd app_a && docker build --push -t pformela/microservice_a_2:latest . && cd ..
# cd app_b && docker build --no-cache --push -t pformela/microservice_b_2:latest . && cd ..
# cd db && docker build --push -t pformela/microservice_db:latest . && cd ..

kubectl apply -f deployment_db.yaml
kubectl apply -f deployment_a.yaml
kubectl apply -f deployment_b.yaml