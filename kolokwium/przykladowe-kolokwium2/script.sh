#!/bin/bash

docker compose build --no-cache
docker compose up -d

sleep 3

curl -X POST localhost:3000/tasks -H "Content-Type: application/json" -d '{"title": "New task 1"}'
curl -X POST localhost:3000/tasks -H "Content-Type: application/json" -d '{"title": "New task 2"}'
curl -X POST localhost:3000/tasks -H "Content-Type: application/json" -d '{"title": "New task 3"}'
